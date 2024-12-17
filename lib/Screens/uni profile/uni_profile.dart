import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/uni%20profile/model/uni_model.dart';
import 'package:gam3ty/backend/uniprofile/uniprofile.dart';
import 'package:image_picker/image_picker.dart';

class UniProfile extends StatefulWidget {
  static const String routeName = 'uni-profile';
  const UniProfile({super.key});

  @override
  State<UniProfile> createState() => _UniProfileState();
}

class _UniProfileState extends State<UniProfile> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  String? _downloadURL;
  final picker = ImagePicker();

  // Text controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController uniLink = TextEditingController();
  // final TextEditingController uniType = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController acceptedPercentage = TextEditingController();
  // final TextEditingController uniStatusType = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController collegeNumber = TextEditingController();
  String? selectedUniType;
  String? selectedStudyType;
  @override
  void dispose() {
    name.dispose();
    uniLink.dispose();
    // uniType.dispose();
    address.dispose();
    contactNumber.dispose();
    acceptedPercentage.dispose();
    // uniStatusType.dispose();
    description.dispose();
    collegeNumber.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = kIsWeb ? null : File(pickedFile.path);
        _downloadURL = kIsWeb ? pickedFile.path : null;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null || (kIsWeb && _downloadURL != null)) {
      try {
        final fileName = kIsWeb
            ? _downloadURL!
            : _imageFile!.path.split('/').last; // Image filename
        final storageRef =
            FirebaseStorage.instance.ref().child('profile/$fileName');

        // Upload for web or mobile
        if (kIsWeb) {
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            await storageRef.putData(await pickedFile.readAsBytes());
          }
        } else {
          await storageRef.putFile(_imageFile!);
        }

        // Retrieve download URL
        final downloadURL = await storageRef.getDownloadURL();
        setState(() {
          _downloadURL = downloadURL;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image uploaded successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading image: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'University Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff90E0EF),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff90E0EF),
              Color(0xff00B4D8),
              Color(0xff0077B6),
              Color(0xff023E8A),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile Image Section
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _imageFile != null && !kIsWeb
                        ? FileImage(_imageFile!) as ImageProvider
                        : _downloadURL != null && _downloadURL!.isNotEmpty
                            ? CachedNetworkImageProvider(_downloadURL!)
                            : const AssetImage('assets/placeholder_image.png'),
                    child: const Icon(Icons.edit, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tap to change profile picture',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 100),

                // Fields
                Row(
                  children: [
                    Expanded(
                        child: _buildTextField(
                            'University Name', name, 'Enter university name')),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: _buildDropdownField(
                        label: 'University Type',
                        hint: 'Select university type',
                        value: selectedUniType,
                        items: ['Public', 'Private', 'Community College'],
                        onChanged: (value) => setState(() {
                          selectedUniType = value;
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: _buildTextField(
                            'Address', address, 'Enter address')),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                          'University Website', uniLink, 'Enter website link',
                          keyboardType: TextInputType.url),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTextField('Contact Number', contactNumber,
                          'Enter contact number',
                          keyboardType: TextInputType.phone),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        'Accepted Percentage',
                        acceptedPercentage,
                        'Enter accepted percentage',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildDropdownField(
                        label: 'University Study Type',
                        hint: 'Select study type',
                        value: selectedStudyType,
                        items: ['Full-time', 'Part-time', 'Online'],
                        onChanged: (value) => setState(() {
                          selectedStudyType = value;
                        }),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTextField(
                        'Number of Colleges',
                        collegeNumber,
                        'Enter number of colleges',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                _buildTextField(
                  'Description',
                  description,
                  'Enter description',
                  maxLines: 3,
                ),

                const SizedBox(height: 20),

                // Save Button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _uploadImage();

                      // Submit data
                      final uniModel = UniModel(
                        name: name.text,
                        uniLink: uniLink.text,
                        uniType: selectedUniType!,
                        address: address.text,
                        contactNumber: contactNumber.text,
                        acceptedPercentage: int.parse(acceptedPercentage.text),
                        uniStatusType: selectedStudyType!,
                        description: description.text,
                        collegeNumber: int.parse(collegeNumber.text),
                        image: _downloadURL ?? "",
                        id: FirebaseAuth.instance.currentUser!.uid,
                      );

                      await UniProfileFunction.addUniProfile(uniModel);

                      // Clear fields
                      name.clear();
                      uniLink.clear();
                      // selectedStudyType.clear();
                      address.clear();
                      contactNumber.clear();
                      acceptedPercentage.clear();
                      // selectedUniType.clear();
                      description.clear();
                      collegeNumber.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('University profile saved!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Save Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String placeholder, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        hint: Text(hint),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }
}
