import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/uni_info.dart';
import 'package:gam3ty/Screens/Profile/profile-screen.dart';
import 'package:gam3ty/Screens/add%20college/college_info.dart';
import 'package:gam3ty/Screens/home/widgets/all_uin_screen.dart';
import 'package:gam3ty/Screens/home/widgets/category_screen.dart';
import 'package:gam3ty/Screens/student%20home/student_home.dart';
import 'package:gam3ty/Screens/uni%20profile/uni_profile.dart';
import 'package:gam3ty/Screens/all_college_screem.dart';
import 'package:gam3ty/backend/firebase_options.dart';
import 'package:gam3ty/Screens/home/home-screen.dart';
import 'package:gam3ty/Screens/Auth/login/login-screen.dart';
import 'package:gam3ty/Screens/Auth/signup/signup-screen.dart';
import 'package:gam3ty/Screens/welcom/wellcome-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Firebase initialization error: $e");
  }

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translation',
      saveLocale: true,
      fallbackLocale: const Locale("en"),
      startLocale: const Locale("en"),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gam3ty",
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        StudentHome.routeName: (context) => const StudentHome(),
        UniProfile.routeName: (context) => const UniProfile(),
        UniInfo.routeName: (context) => const UniInfo(),
        CollegeScreen.routeName: (context) => const CollegeScreen(),
        CollegeInfo.routeName: (context) => const CollegeInfo(),
        CategoryScreen.routeName: (context) => const CategoryScreen(),
        AllUinScreen.routeName: (context) => const AllUinScreen(),
      },
    );
  }
}
