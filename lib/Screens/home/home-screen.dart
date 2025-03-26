import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/add_uni_screen.dart';
import 'package:gam3ty/Screens/Profile/profile-screen.dart';
import 'package:gam3ty/Screens/home/widgets/categorey_part.dart';
import 'package:gam3ty/Screens/uni%20profile/uni_profile.dart';
import 'package:gam3ty/Screens/all_college_screem.dart';
import 'package:gam3ty/backend/Auth/auth.dart';
import 'package:gam3ty/Screens/home/widgets/home-first-part.dart';
import 'package:gam3ty/Widgets/mydevider.dart';
import 'package:gam3ty/Screens/home/widgets/second-home-part.dart';
import 'package:gam3ty/Screens/welcom/widgets/tail_part_kome.dart';
import 'package:gam3ty/Screens/welcom/wellcome-screen.dart';
import 'package:gam3ty/test.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              AuthFunctions.signOut();
              Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
            },
          )
        ],
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
                  // Navigator.pushNamed(context, UniProfile.routeName);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddUniScreen(),
                      ));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeScreen(),
                      ));
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
              // TextButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, ProfileScreen.routeName);
              //   },
              //   child: Text(
              //     'Profile',
              //     style: GoogleFonts.domine(
              //       fontSize: 20,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              TextButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, WellcomeScreen.routeName);
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
      body: Container(
          height: double.infinity,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomefirstPart(),
                    MyDivider(text: "our-universities".tr()),
                    SizedBox(height: 20),
                    CategoryPart(),
                    SizedBox(height: 20),
                    TailPart()
                  ]))),
    );
  }
}
