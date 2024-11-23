import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/welcom/widgets/ThirdPart.dart';
import 'package:gam3ty/Screens/welcom/widgets/first-part.dart';
import 'package:gam3ty/Screens/home/home-screen.dart';
import 'package:gam3ty/Screens/Auth/login/login-screen.dart';
import 'package:gam3ty/Widgets/mydevider.dart';
import 'package:gam3ty/Screens/welcom/widgets/second-part.dart';
import 'package:gam3ty/Screens/welcom/widgets/tail_part_kome.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  try {
                    // Corrected conditional navigation
                    final targetRoute = FirebaseAuth.instance.currentUser !=
                            null
                        ? HomeScreen
                            .routeName // Navigate to HomeScreen if the user is logged in
                        : LoginScreen
                            .routeName; // Navigate to LoginScreen if the user is not logged in
                    Navigator.pushReplacementNamed(context, targetRoute);
                  } catch (e) {
                    // Error handling
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error navigating: $e')),
                    );
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Part Section
              const FirstPart(),

              // Second Part Section
              const SecondPart(),

              // Divider
              const SizedBox(height: 20),
              MyDivider(
                text: "Universities",
              ),

              // University Grid Section
              const SizedBox(height: 20),
              const ThirdPart(),
              const Divider(),
              const TailPart(),
            ],
          ),
        ),
      ),
    );
  }
}
