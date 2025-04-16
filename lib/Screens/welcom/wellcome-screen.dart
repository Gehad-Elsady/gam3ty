import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Profile/profile-screen.dart';
import 'package:gam3ty/Screens/all_college_screem.dart';
import 'package:gam3ty/Screens/contact/contact-screen.dart';
import 'package:gam3ty/Screens/home/widgets/all_uin_screen.dart';
import 'package:gam3ty/Screens/student%20home/student_home.dart';
import 'package:gam3ty/Screens/welcom/widgets/ThirdPart.dart';
import 'package:gam3ty/Screens/home/home-screen.dart';
import 'package:gam3ty/Screens/Auth/login/login-screen.dart';
import 'package:gam3ty/Screens/welcom/widgets/first-part.dart';
import 'package:gam3ty/Widgets/mydevider.dart';
import 'package:gam3ty/Screens/welcom/widgets/second-part.dart';
import 'package:gam3ty/Screens/welcom/widgets/tail_part_kome.dart';
import 'package:gam3ty/backend/Auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    // Show the welcome dialog after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'welcome'.tr() + 'website'.tr(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'massage_1'.tr(),
                ),
                SizedBox(height: 10),
                Text(
                  'massage_2'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('massage_3'.tr()),
                Text(
                  'massage_4'.tr(),
                ),
                Text(
                  'massage_5'.tr(),
                ),
                Text(
                  'massage_6'.tr(),
                ),
                Text(
                  'massage_7'.tr(),
                ),
                Text(
                  'massage_8'.tr(),
                ),
                Text(
                  'massage_9'.tr(),
                ),
                SizedBox(height: 10),
                Text(
                  'future'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('future_1'.tr()),
                Text('future_2'.tr()),
                Text('future_3'.tr()),
                Text('future_4'.tr()),
                SizedBox(height: 10),
                Text(
                  'future_5'.tr(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "got_it".tr(),
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = context.locale;

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
                fixedSize: const Size(160, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
              ),
              onPressed: () async {
                try {
                  User? firebaseUser = FirebaseAuth.instance.currentUser;

                  if (firebaseUser == null) {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                    return;
                  }

                  print("Firebase User is logged in: ${firebaseUser.email}");
                  var userData = await AuthFunctions.readUserData();

                  if (userData == null || userData.role == null) {
                    print("User data or role is null.");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User data or role is missing')),
                    );
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                    return;
                  }

                  if (userData.role == 'Student') {
                    Navigator.pushReplacementNamed(
                        context, StudentHome.routeName);
                  } else if (userData.role == 'University') {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  } else {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error navigating: $e')),
                  );
                }
              },
              child: Text(
                "login".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            if (currentLocale.languageCode == 'en') {
              context.setLocale(const Locale("ar"));
            } else {
              context.setLocale(const Locale("en"));
            }
          },
          icon: const Icon(Icons.g_translate_outlined),
        ),
        title: Row(
          children: [
            Image.asset(
              "assets/images/Gam3ty-removebg-preview.png",
              height: 100,
            ),
            SizedBox(width: 10),
            Text(
              'website'.tr(),
              style: GoogleFonts.domine(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        flexibleSpace: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, StudentHome.routeName);
                },
                child: Text(
                  'home'.tr(),
                  style: GoogleFonts.domine(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AllUinScreen.routeName);
                },
                child: Text(
                  'universityies'.tr(),
                  style: GoogleFonts.domine(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, CollegeScreen.routeName);
                },
                child: Text(
                  'colleges'.tr(),
                  style: GoogleFonts.domine(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ContactScreen.routeName);
                },
                child: Text(
                  'contact-us'.tr(),
                  style: GoogleFonts.domine(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstPart(),
              const SecondPart(),
              const SizedBox(height: 20),
              MyDivider(text: "universities".tr()),
              const SizedBox(height: 20),
              ThirdPart(),
              const Divider(),
              TailPart(),
            ],
          ),
        ),
      ),
    );
  }
}
