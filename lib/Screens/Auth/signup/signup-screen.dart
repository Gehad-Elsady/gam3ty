import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/backend/Auth/auth.dart';
import 'package:gam3ty/Screens/Auth/login/login-screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signup-screen';
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _usernameController = TextEditingController();
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/pexels-pixabay-267885.jpg",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.65,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "create-account".tr(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.domine(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: role == "University"
                                        ? MaterialStateProperty.all(
                                            Colors.blue[900])
                                        : MaterialStateProperty.all(
                                            Colors.transparent),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      role = "University";
                                    });
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.admin_panel_settings_rounded,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "university".tr(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: role == "Student"
                                        ? MaterialStateProperty.all(
                                            Colors.blue[900])
                                        : MaterialStateProperty.all(
                                            Colors.transparent),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      role = "Student";
                                    });
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.person_2_rounded,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "student".tr(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            role == "University"
                                ? DropdownButton(
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Select Role"),
                                        value: null,
                                      ),
                                      DropdownMenuItem(
                                          child: Text("Teacher"),
                                          value: "Teacher"),
                                      DropdownMenuItem(
                                          child: Text("Teacher"),
                                          value: "Teacher"),
                                      DropdownMenuItem(
                                          child: Text("Teacher"),
                                          value: "Teacher"),
                                      DropdownMenuItem(
                                          child: Text("Teacher"),
                                          value: "Teacher"),
                                      DropdownMenuItem(
                                          child: Text("Teacher"),
                                          value: "Teacher"),
                                      DropdownMenuItem(
                                          child: Text("Teacher"),
                                          value: "Teacher"),
                                    ],
                                    onChanged: (value) {},
                                  )
                                : SizedBox(),
                            // Name Field
                            _buildInputField(
                              controller: _usernameController,
                              label: 'name'.tr(),
                              prefixIcon: Icons.person,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'name-error'.tr();
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            // Email Field
                            _buildInputField(
                              controller: _emailController,
                              label: 'enter-email'.tr(),
                              prefixIcon: Icons.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'empty-email-error'.tr();
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'email-error'.tr();
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            // Password Field
                            _buildInputField(
                              controller: _passwordController,
                              label: 'enter-password'.tr(),
                              prefixIcon: Icons.lock,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'empty-pass-error'.tr();
                                } else if (value.length < 6) {
                                  return 'pass-error'.tr();
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            // Confirm Password Field
                            _buildInputField(
                              controller: _confirmPasswordController,
                              label: 'confirm-password'.tr(),
                              prefixIcon: Icons.lock,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'confirm-password-error'.tr();
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  AuthFunctions.SignUp(_emailController.text,
                                      _passwordController.text, onSuccess: () {
                                    Navigator.pushReplacementNamed(
                                        context, LoginScreen.routeName);
                                  }, onError: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Failed to sign up')));
                                  },
                                      userName: _usernameController.text,
                                      role: role!);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Text(
                                'signup'.tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "have-an-account".tr(),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      LoginScreen.routeName,
                                    );
                                  },
                                  child: Text(
                                    "login".tr(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData prefixIcon,
    bool obscureText = false,
    required String? Function(String?) validator,
    required TextEditingController? controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(prefixIcon, color: Colors.blue),
        ),
        validator: validator,
      ),
    );
  }
}
