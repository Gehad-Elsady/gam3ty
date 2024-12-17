import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gam3ty/Screens/Profile/model/profilemodel.dart';
import 'package:gam3ty/Screens/uni%20profile/model/uni_model.dart';

class UniProfileFunction {
  static CollectionReference<UniModel> getUniProfileCollection() {
    return FirebaseFirestore.instance
        .collection("UniversityProfile")
        .withConverter<UniModel>(
      fromFirestore: (snapshot, options) {
        return UniModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

  static Future<void> addUniProfile(UniModel uni) {
    var collection = getUniProfileCollection();
    var docRef = collection.doc(uni.id);
    return docRef.set(uni);
  }

  static Stream<UniModel?> getUniProfile(String uid) {
    return FirebaseFirestore.instance
        .collection('UniversityProfile')
        .doc(uid)
        .snapshots()
        .map((userProfileSnapshot) {
      if (userProfileSnapshot.exists) {
        var data = userProfileSnapshot.data() as Map<String, dynamic>;
        return UniModel.fromJson(
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
