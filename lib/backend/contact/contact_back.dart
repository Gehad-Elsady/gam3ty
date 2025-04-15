import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/Screens/contact/model/contact-model.dart';

class ContactBack {
  static Future<void> addProblem(ContactModel problem) async {
    try {
      await FirebaseFirestore.instance
          .collection('Problem')
          .doc()
          .withConverter<ContactModel>(
        fromFirestore: (snapshot, options) {
          return ContactModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.toJson();
        },
      ).set(problem);
      print('problem added successfully!');
    } catch (e) {
      print('Error adding problem: $e');
    }
  }
}
