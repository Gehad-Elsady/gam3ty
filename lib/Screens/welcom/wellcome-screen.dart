import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/student%20home/student_home.dart';
import 'package:gam3ty/Screens/welcom/widgets/ThirdPart.dart';
import 'package:gam3ty/Screens/home/home-screen.dart';
import 'package:gam3ty/Screens/Auth/login/login-screen.dart';
import 'package:gam3ty/Screens/welcom/widgets/first-part.dart';
import 'package:gam3ty/Widgets/mydevider.dart';
import 'package:gam3ty/Screens/welcom/widgets/second-part.dart';
import 'package:gam3ty/Screens/welcom/widgets/tail_part_kome.dart';
import 'package:gam3ty/backend/Auth/auth.dart';

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
              onPressed: () async {
                try {
                  // Check if the user is logged in (i.e., FirebaseAuth.currentUser is not null)
                  User? firebaseUser = FirebaseAuth.instance.currentUser;

                  if (firebaseUser == null) {
                    // If the user is not logged in, navigate to the login screen
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                    return;
                  }

                  // If the user is logged in, fetch user data
                  print("Firebase User is logged in: ${firebaseUser.email}");

                  var userData = await AuthFunctions.readUserData();

                  // If userData is null, handle the case of missing data
                  if (userData == null || userData.role == null) {
                    print("User data or role is null.");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User data or role is missing')),
                    );
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                    return;
                  }

                  // Handle navigation based on the role
                  if (userData.role == 'Student') {
                    Navigator.pushReplacementNamed(
                        context, StudentHome.routeName);
                  } else if (userData.role == 'University') {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  } else {
                    // If the role is unknown, navigate to the login page
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  }
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
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Part Section
              FirstPart(),
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
