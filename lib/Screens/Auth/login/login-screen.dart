import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/student%20home/student_home.dart';
import 'package:gam3ty/backend/Auth/auth.dart';
import 'package:gam3ty/Screens/home/home-screen.dart';
import 'package:gam3ty/Screens/Auth/signup/signup-screen.dart';
import 'package:gam3ty/Screens/welcom/wellcome-screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login-screen';
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff90E0EF),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
            },
            icon: Icon(
              Icons.home,
              size: 30,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              icon: Icon(Icons.language_outlined, color: Colors.white),
              onPressed: () {
                // Add settings functionality here
              },
            ),
          ),
        ],
      ),
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
        child: Padding(
          padding: const EdgeInsets.only(right: 150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset(
                "assets/lotties/Animation - 1732106497345.json",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(
                width: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Login to Your Account",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.domine(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
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
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.email, color: Colors.blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
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
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthFunctions.Login(
                                _emailController.text, _passwordController.text,
                                onSuccess: () async {
                              // Fetch user data (ensure it is an async function if needed)
                              final userData =
                                  await AuthFunctions.readUserData();

                              // Check user role and navigate accordingly
                              if (userData!.role == 'Student') {
                                Navigator.pushReplacementNamed(
                                    context, StudentHome.routeName);
                              } else if (userData.role == 'University') {
                                Navigator.pushReplacementNamed(
                                    context, HomeScreen.routeName);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: Text("Error"),
                                        content: Text("Invalid user role"),
                                        actions: [
                                          TextButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              }),
                                        ]);
                                  },
                                );
                              }
                            }, onError: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text("Error"),
                                      content:
                                          Text("Invalid email or password"),
                                      actions: [
                                        TextButton(
                                            child: Text("OK"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                      ]);
                                },
                              );
                            });
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
                          'Login',
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
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, SignUpScreen.routeName);
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
