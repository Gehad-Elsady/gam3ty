import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gam3ty/Screens/add%20college/model/college_model.dart';

class AddCollegeBack {
  static CollectionReference<CollegeModel> getCollegeCollection() {
    return FirebaseFirestore.instance
        .collection("Colleges")
        .withConverter<CollegeModel>(
      fromFirestore: (snapshot, options) {
        return CollegeModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

  static Future<void> addCollegeData(CollegeModel college) {
    var collection = getCollegeCollection();
    var docRef = collection.doc();
    return docRef.set(college);
  }

  static Stream<List<CollegeModel>> getCollegeStream(String id) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return _firestore
        .collection('Colleges')
        .where('uin_id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return CollegeModel(
          id: data['id'] ?? "no id",
          uinId: data['uin_id'] ?? "no id",
          Tuitionfees: data['Tuitionfees'] ?? "0",
          academicYear: data['academicYear'] ?? "0",
          nameAr: data['nameAr'] ?? 'No Name',
          nameEn: data['nameEn'] ?? 'No Name',
          collegePresidentAr: data['collegePresidentAr'] ?? 'No Name',
          collegePresidentEn: data['collegePresidentEn'] ?? 'No Name',
          image: data['image'] ?? 'default_image.png',
          establishDate: data['establishDate']?.toString() ?? "0",
          addressAr: data['addressAr'] ?? 'No Name',
          addressEn: data['addressEn'] ?? 'No Name',
          contactNumber: data['contactNumber'] ?? 'No Name',
          email: data['email'] ?? 'No Name',
          acceptedPercentage: data['acceptedPercentage']?.toString() ?? "0",
          uniLink: data['uniLink'] ?? 'No Name',
          descriptionAr: data['descriptionAr'] ?? 'No Name',
          descriptionEn: data['descriptionEn'] ?? 'No Name',
          studyingType: data['studyingType'] ?? 'No Name',
          fieldsAr: List<String>.from(data['fieldsAr'] ?? []),
          fieldsEn: List<String>.from(data['fieldsEn'] ?? []),
          advantagesAr: List<String>.from(data['advantagesAr'] ?? []),
          advantagesEn: List<String>.from(data['advantagesEn'] ?? []),
          disadvantagesAr: List<String>.from(data['disadvantagesAr'] ?? []),
          disadvantagesEn: List<String>.from(data['disadvantagesEn'] ?? []),
          careerOpportunitiesArList:
              List<String>.from(data['careerOpportunitiesArList'] ?? []),
          careerOpportunitiesEnList:
              List<String>.from(data['careerOpportunitiesEnList'] ?? []),
          expectedJobsAr: List<String>.from(data['expectedJobsAr'] ?? []),
          expectedJobsEn: List<String>.from(data['expectedJobsEn'] ?? []),
        );
      }).toList();
    });
  }

  static Stream<List<CollegeModel>> getAllCollegeStream() {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return _firestore.collection('Colleges').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return CollegeModel(
          id: data['id'] ?? "no id",
          uinId: data['uin_id'] ?? "no id",
          Tuitionfees: data['Tuitionfees'] ?? "0",
          academicYear: data['academicYear'] ?? "0",
          nameAr: data['nameAr'] ?? 'No Name',
          nameEn: data['nameEn'] ?? 'No Name',
          collegePresidentAr: data['collegePresidentAr'] ?? 'No Name',
          collegePresidentEn: data['collegePresidentEn'] ?? 'No Name',
          image: data['image'] ?? 'default_image.png',
          establishDate: data['establishDate']?.toString() ?? "0",
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
          fieldsAr: List<String>.from(data['fieldsAr'] ?? []),
          fieldsEn: List<String>.from(data['fieldsEn'] ?? []),
          disadvantagesAr: List<String>.from(data['disadvantagesAr'] ?? []),
          disadvantagesEn: List<String>.from(data['disadvantagesEn'] ?? []),
          careerOpportunitiesArList:
              List<String>.from(data['careerOpportunitiesArList'] ?? []),
          careerOpportunitiesEnList:
              List<String>.from(data['careerOpportunitiesEnList'] ?? []),
          expectedJobsAr: List<String>.from(data['expectedJobsAr'] ?? []),
          expectedJobsEn: List<String>.from(data['expectedJobsEn'] ?? []),
        );
      }).toList();
    });
  }
}
