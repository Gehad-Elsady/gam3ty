import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gam3ty/Screens/Auth/model/usermodel.dart';

class AuthFunctions {
  static SignUp(String emailAddress, String password,
      {required Function onSuccess,
      required Function onError,
      required String role,
      required String userName}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      credential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
        email: emailAddress,
        name: userName,
        id: credential.user!.uid,
        role: role,
      );
      addUser(userModel);

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      print(e);
    }
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJason(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJason();
      },
    );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Login(
    String emailAddress,
    String password, {
    required Function onSuccess,
    required Function onError,
    // Callback for unverified email
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      // Check if the user's email is verified
      if (credential.user?.emailVerified ?? false) {
        onSuccess();
      } else {
        onError('Email not verified. Please verify your email.');
      }
    } on FirebaseAuthException catch (e) {
      onError();
    }
  }

  static signOut() {
    FirebaseAuth.instance.signOut();
  }

  static Future<UserModel?> readUserData() async {
    var collection = getUserCollection();

    DocumentSnapshot<UserModel> docUser =
        await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return docUser.data();
  }
}
