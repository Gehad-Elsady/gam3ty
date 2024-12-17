import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';

class AddUniBack {
  static CollectionReference<AddUinModel> getUniProfileCollection() {
    return FirebaseFirestore.instance
        .collection("Add-University")
        .withConverter<AddUinModel>(
      fromFirestore: (snapshot, options) {
        return AddUinModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

  static Future<void> addUniData(AddUinModel uni) {
    var collection = getUniProfileCollection();
    var docRef = collection.doc(uni.id);
    return docRef.set(uni);
  }

  static Stream<List<AddUinModel>> getUniStream() {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return _firestore.collection('Add-University').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return AddUinModel(
          id: data['id'] ?? "no id",
          image: data['image'] ?? 'default_image.png',
          uinNameAr: data['uinNameAr'] ?? 'No Name',
          uinNameEn: data['uinNameEn'] ?? 'No Name',
          establishDate: data['establishDate']?.toString() ?? "0",
          numberOfColleges: data['numberOfColleges']?.toString() ?? "0",
          numberOfStudents: data['numberOfStudents']?.toString() ?? "0",
          numberOfTeachers: data['numberOfTeachers']?.toString() ?? "0",
          universityPresidentAr: data['universityPresidentAr'] ?? 'No Name',
          universityPresidentEn: data['universityPresidentEn'] ?? 'No Name',
          addressAr: data['addressAr'] ?? 'No Name',
          addressEn: data['addressEn'] ?? 'No Name',
          contactNumber: data['contactNumber'] ?? 'No Name',
          email: data['email'] ?? 'No Name',
          acceptedPercentage: data['acceptedPercentage']?.toString() ?? "0",
          uniLink: data['uniLink'] ?? 'No Name',
          descriptionAr: data['descriptionAr'] ?? 'No Name',
          descriptionEn: data['descriptionEn'] ?? 'No Name',
          studyingType: data['studyingType'] ?? 'No Name',
          advantagesAr: List<String>.from(data['advantagesAr'] ?? []),
          advantagesEn: List<String>.from(data['advantagesEn'] ?? []),
          disadvantagesAr: List<String>.from(data['disadvantagesAr'] ?? []),
          disadvantagesEn: List<String>.from(data['disadvantagesEn'] ?? []),
          allowCitiesAr: List<String>.from(data['allowCitiesAr'] ?? []),
          allowCitiesEn: List<String>.from(data['allowCitiesEn'] ?? []),
        );
      }).toList();
    });
  }
}
