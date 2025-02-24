import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/backend/Add%20uni/add_uni_back.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  // Controllers for text fields
  final TextEditingController idController = TextEditingController();
  final TextEditingController uinNameArController = TextEditingController();
  final TextEditingController uinNameEnController = TextEditingController();
  final TextEditingController establishDateController = TextEditingController();
  final TextEditingController numberOfCollegesController =
      TextEditingController();
  final TextEditingController numberOfStudentsController =
      TextEditingController();
  final TextEditingController numberOfTeachersController =
      TextEditingController();
  final TextEditingController universityPresidentArController =
      TextEditingController();
  final TextEditingController universityPresidentEnController =
      TextEditingController();
  final TextEditingController addressArController = TextEditingController();
  final TextEditingController addressEnController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController acceptedPercentageController =
      TextEditingController();
  final TextEditingController uniLinkController = TextEditingController();
  final TextEditingController descriptionArController = TextEditingController();
  final TextEditingController descriptionEnController = TextEditingController();
  final TextEditingController studyingTypeController = TextEditingController();

  // Lists for dropdowns and selected items
  final List<String> advantagesAr = [];
  final List<String> advantagesEn = [];
  final List<String> disadvantagesAr = [];
  final List<String> disadvantagesEn = [];
  final List<String> allowCitiesAr = [];
  final List<String> allowCitiesEn = [];

  final List<String> availableAdvantagesAr = ['مميز1', 'مميز2', 'مميز3'];
  final List<String> availableAdvantagesEn = [
    'Advantage1',
    'Advantage2',
    'Advantage3'
  ];
  final List<String> availableDisadvantagesAr = ['عيب1', 'عيب2', 'عيب3'];
  final List<String> availableDisadvantagesEn = [
    'Disadvantage1',
    'Disadvantage2',
    'Disadvantage3'
  ];
  final List<String> availableCitiesAr = ['مدينة1', 'مدينة2', 'مدينة3'];
  final List<String> availableCitiesEn = ['City1', 'City2', 'City3'];

  // For image upload
  Uint8List webImage = Uint8List(0);
  File? _imageFile;
  String? _imageURL;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        final Uint8List photo = await image.readAsBytes();
        setState(() => webImage = photo);
      } else {
        setState(() => _imageFile = File(image.path));
      }
    }
  }

  Future<void> _uploadImage() async {
    if (webImage.isNotEmpty || _imageFile != null) {
      try {
        String fileName = "${DateTime.now().millisecondsSinceEpoch}.png";
        Reference storageRef = _storage.ref().child('profile/$fileName');

        if (kIsWeb) {
          await storageRef.putData(
              webImage, SettableMetadata(contentType: "image/png"));
        } else {
          await storageRef.putFile(
              _imageFile!, SettableMetadata(contentType: "image/png"));
        }

        String downloadURL = await storageRef.getDownloadURL();
        setState(() => _imageURL = downloadURL);
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  void _addItemToList(
      String item, List<String> list, List<String> availableList) {
    setState(() {
      list.add(item);
      availableList.remove(item);
    });
  }

  void _removeItemFromList(
      String item, List<String> list, List<String> availableList) {
    setState(() {
      list.remove(item);
      availableList.add(item);
    });
  }

  Widget _buildDropdown(
      String label, List<String> list, List<String> availableList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          isExpanded: true,
          hint: Text('Select $label'),
          value: availableList.isEmpty ? null : availableList.first,
          items: availableList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              _addItemToList(value, list, availableList);
            }
          },
        ),
        Wrap(
          children: list.map((item) {
            return Chip(
              label: Text(item),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () {
                _removeItemFromList(item, list, availableList);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add University Information')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'ID')),
            TextField(
                controller: uinNameArController,
                decoration:
                    const InputDecoration(labelText: 'University Name (AR)')),
            TextField(
                controller: uinNameEnController,
                decoration:
                    const InputDecoration(labelText: 'University Name (EN)')),
            TextField(
                controller: establishDateController,
                decoration: const InputDecoration(labelText: 'Establish Date')),
            TextField(
                controller: numberOfCollegesController,
                decoration:
                    const InputDecoration(labelText: 'Number of Colleges')),
            TextField(
                controller: numberOfStudentsController,
                decoration:
                    const InputDecoration(labelText: 'Number of Students')),
            TextField(
                controller: numberOfTeachersController,
                decoration:
                    const InputDecoration(labelText: 'Number of Teachers')),
            TextField(
                controller: universityPresidentArController,
                decoration: const InputDecoration(
                    labelText: 'University President (AR)')),
            TextField(
                controller: universityPresidentEnController,
                decoration: const InputDecoration(
                    labelText: 'University President (EN)')),
            TextField(
                controller: addressArController,
                decoration: const InputDecoration(labelText: 'Address (AR)')),
            TextField(
                controller: addressEnController,
                decoration: const InputDecoration(labelText: 'Address (EN)')),
            TextField(
                controller: contactNumberController,
                decoration: const InputDecoration(labelText: 'Contact Number')),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: acceptedPercentageController,
                decoration:
                    const InputDecoration(labelText: 'Accepted Percentage')),
            TextField(
                controller: uniLinkController,
                decoration:
                    const InputDecoration(labelText: 'University Link')),
            TextField(
                controller: descriptionArController,
                decoration:
                    const InputDecoration(labelText: 'Description (AR)')),
            TextField(
                controller: descriptionEnController,
                decoration:
                    const InputDecoration(labelText: 'Description (EN)')),
            TextField(
                controller: studyingTypeController,
                decoration: const InputDecoration(labelText: 'Studying Type')),
            const SizedBox(height: 10),
            _buildDropdown(
                'Advantages (AR)', advantagesAr, availableAdvantagesAr),
            const SizedBox(height: 16),
            _buildDropdown(
                'Advantages (EN)', advantagesEn, availableAdvantagesEn),
            const SizedBox(height: 16),
            _buildDropdown('Disadvantages (AR)', disadvantagesAr,
                availableDisadvantagesAr),
            const SizedBox(height: 16),
            _buildDropdown('Disadvantages (EN)', disadvantagesEn,
                availableDisadvantagesEn),
            const SizedBox(height: 16),
            _buildDropdown(
                'Allowed Cities (AR)', allowCitiesAr, availableCitiesAr),
            const SizedBox(height: 16),
            _buildDropdown(
                'Allowed Cities (EN)', allowCitiesEn, availableCitiesEn),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _pickImage, child: const Text('Pick Image')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _uploadImage, child: const Text('Upload Image')),
            if (_imageURL != null)
              Image.network(_imageURL!,
                  height: 150, width: 150, fit: BoxFit.cover),
            ElevatedButton(
                onPressed: () {
                  AddUinModel data = AddUinModel(
                    uniType: "",
                    id: idController.text,
                    uinNameAr: uinNameArController.text,
                    uinNameEn: uinNameEnController.text,
                    establishDate: establishDateController.text,
                    numberOfColleges: numberOfCollegesController.text,
                    numberOfStudents: numberOfStudentsController.text,
                    numberOfTeachers: numberOfTeachersController.text,
                    universityPresidentAr: universityPresidentArController.text,
                    universityPresidentEn: universityPresidentEnController.text,
                    addressAr: addressArController.text,
                    addressEn: addressEnController.text,
                    contactNumber: contactNumberController.text,
                    email: emailController.text,
                    acceptedPercentage: acceptedPercentageController.text,
                    uniLink: uniLinkController.text,
                    descriptionAr: descriptionArController.text,
                    descriptionEn: descriptionEnController.text,
                    studyingType: studyingTypeController.text,
                    advantagesAr: advantagesAr,
                    advantagesEn: advantagesEn,
                    disadvantagesAr: disadvantagesAr,
                    disadvantagesEn: disadvantagesEn,
                    allowCitiesAr: allowCitiesAr,
                    allowCitiesEn: allowCitiesEn,
                    image: _imageURL!,
                  );
                  AddUniBack.addUniData(data);
                },
                child: const Text('Submit Data')),
          ],
        ),
      ),
    );
  }
}
