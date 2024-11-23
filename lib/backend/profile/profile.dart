import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gam3ty/Screens/Auth/model/usermodel.dart';
import 'package:gam3ty/Screens/Profile/model/profilemodel.dart';

class ProfileFunction {
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

  static Future<UserModel?> readUserData() async {
    var collection = getUserCollection();

    DocumentSnapshot<UserModel> docUser =
        await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return docUser.data();
  }

  static CollectionReference<ProfileModel> getUserProfileCollection() {
    return FirebaseFirestore.instance
        .collection("UsersProfile")
        .withConverter<ProfileModel>(
      fromFirestore: (snapshot, options) {
        return ProfileModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

  static Future<void> addUserProfile(ProfileModel user) {
    var collection = getUserProfileCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Stream<ProfileModel?> getUserProfile(String uid) {
    return FirebaseFirestore.instance
        .collection('UsersProfile')
        .doc(uid)
        .snapshots()
        .map((userProfileSnapshot) {
      if (userProfileSnapshot.exists) {
        var data = userProfileSnapshot.data() as Map<String, dynamic>;
        return ProfileModel.fromJson(
            data); // Assuming ProfileModel has a fromJson constructor
      } else {
        print('User profile not found');
      }
    }).handleError((e) {
      print('Error fetching user profile: $e');
      return null; // Handle errors by returning null
    });
  }
}
