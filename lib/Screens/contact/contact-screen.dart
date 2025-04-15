import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/contact/model/contact-model.dart';
import 'package:gam3ty/backend/contact/contact_back.dart';

class ContactScreen extends StatefulWidget {
  static const String routeName = 'contact-screen';

  const ContactScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'contact'.tr(),
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: const Color(0xFF0091ad),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'contact-title'.tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'name'.tr(),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'enter-email'.tr(),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _messageController,
                  decoration: InputDecoration(
                    labelText: 'massage'.tr(),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      fixedSize: Size(200, 50),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // If form is valid, save the data
                        ContactModel problem = ContactModel(
                          name: _nameController.text,
                          email: _emailController.text,
                          message: _messageController.text,
                          id: FirebaseAuth.instance.currentUser!.uid,
                        );
                        ContactBack.addProblem(problem);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Your message has been sent!')),
                        );

                        // Clear fields after submission
                        _nameController.clear();
                        _emailController.clear();
                        _messageController.clear();
                      }
                    },
                    child: Text(
                      'send'.tr(),
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
