import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Profile/profile-screen.dart';
import 'package:gam3ty/backend/firebase_options.dart';
import 'package:gam3ty/Screens/home/home-screen.dart';
import 'package:gam3ty/Screens/Auth/login/login-screen.dart';
import 'package:gam3ty/Screens/Auth/signup/signup-screen.dart';
import 'package:gam3ty/Screens/welcom/wellcome-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
