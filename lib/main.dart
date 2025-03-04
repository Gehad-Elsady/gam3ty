import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/uni_info.dart';
import 'package:gam3ty/Screens/Profile/profile-screen.dart';
import 'package:gam3ty/Screens/add%20college/college_info.dart';
import 'package:gam3ty/Screens/home/widgets/all_uin_screen.dart';
import 'package:gam3ty/Screens/home/widgets/category_screen.dart';
import 'package:gam3ty/Screens/home/widgets/second-home-part.dart';
import 'package:gam3ty/Screens/student%20home/student_home.dart';
import 'package:gam3ty/Screens/uni%20profile/uni_profile.dart';
import 'package:gam3ty/Screens/uni_screem.dart';
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
        StudentHome.routeName: (context) => StudentHome(),
        UniProfile.routeName: (context) => UniProfile(),
        UniInfo.routeName: (context) => const UniInfo(),
        // SecondHomePart.routeName: (context) => SecondHomePart(),
        CollegeScreen.routeName: (context) => CollegeScreen(),
        CollegeInfo.routeName: (context) => CollegeInfo(),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        AllUinScreen.routeName: (context) => const AllUinScreen(),
      },
    );
  }
}
