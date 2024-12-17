import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Profile/model/profilemodel.dart';
import 'package:gam3ty/backend/profile/profile.dart';
import 'package:gam3ty/validation/validation.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  String? _downloadURL;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final picker = ImagePicker();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactNumber = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    address.dispose();
    contactNumber.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        setState(() {
          _imageFile = null;
          _downloadURL = pickedFile.path; // For web, use the path
        });
      } else {
        setState(() {
          _imageFile = File(pickedFile.path); // For mobile, use File
          _downloadURL = null;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null || (kIsWeb && _downloadURL != null)) {
      try {
        final fileName =
            (kIsWeb ? _downloadURL! : _imageFile!.path.split('/').last);
        final storageRef = _storage.ref().child('profile/$fileName');

        if (kIsWeb) {
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            await storageRef.putData(await pickedFile.readAsBytes());
          }
        } else {
          await storageRef.putFile(_imageFile!);
        }

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
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0091ad),
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
        child: StreamBuilder(
          stream: ProfileFunction.getUserProfile(
            FirebaseAuth.instance.currentUser!.uid,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return _buildForm();
            }

            ProfileModel userProfile = snapshot.data!;
            firstName.text = userProfile.firstName ?? "";
            lastName.text = userProfile.lastName ?? "";
            email.text = userProfile.email ?? "";
            address.text = userProfile.address ?? "";
            contactNumber.text = userProfile.phoneNumber ?? "";
            _downloadURL = userProfile.profileImage ?? "";

            return _buildForm();
          },
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: _imageFile != null && !kIsWeb
                      ? FileImage(_imageFile!) as ImageProvider
                      : _downloadURL != null && _downloadURL!.isNotEmpty
                          ? CachedNetworkImageProvider(_downloadURL!)
                          : const NetworkImage(
                              'https://static.vecteezy.com/system/resources/thumbnails/005/720/408/small_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg',
                            ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: firstName,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'First name is required' : null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: lastName,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Last name is required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              validator: Validation.validateEmail(email.text),
            ),
            const SizedBox(height: 30),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: address,
              decoration: const InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Address is required' : null,
            ),
            const SizedBox(height: 30),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: contactNumber,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Phone number is required' : null,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _uploadImage(); // Upload the image before saving

                      ProfileModel data = ProfileModel(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        address: address.text,
                        phoneNumber: contactNumber.text,
                        email: email.text,
                        profileImage: _downloadURL ??
                            "", // Use existing URL if no image selected
                        id: FirebaseAuth.instance.currentUser!.uid,
                        // selectedFieldOfStudy: "selectedFieldOfStudy" ?? '',
                        // gpa: 5,
                        // locationPreferences: "locationPreference",
                      );
                      ProfileFunction.addUserProfile(data);
                      firstName.clear();
                      lastName.clear();
                      address.clear();
                      contactNumber.clear();
                      email.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile saved')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    backgroundColor: Colors.green,
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
