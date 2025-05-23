import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/add_uni_screen.dart';
import 'package:gam3ty/Screens/Profile/profile-screen.dart';
import 'package:gam3ty/Screens/all_college_screem.dart';
import 'package:gam3ty/Screens/contact/contact-screen.dart';
import 'package:gam3ty/Screens/home/widgets/all_uin_screen.dart';
import 'package:gam3ty/Screens/home/widgets/categorey_part.dart';

import 'package:gam3ty/Screens/student%20home/widget/student_frist_home.dart';
import 'package:gam3ty/Screens/welcom/wellcome-screen.dart';
import 'package:gam3ty/Screens/welcom/widgets/tail_part_kome.dart';
import 'package:gam3ty/Widgets/mydevider.dart';
import 'package:gam3ty/backend/Auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentHome extends StatelessWidget {
  static const String routeName = 'student-home';
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = context.locale;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (currentLocale.languageCode == 'en') {
                context.setLocale(const Locale("ar"));
              } else {
                context.setLocale(const Locale("en"));
              }
            },
            icon: const Icon(Icons.g_translate_outlined),
          ),
          FirebaseAuth.instance.currentUser != null
              ? IconButton(
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    AuthFunctions.signOut();
                    Navigator.pushReplacementNamed(
                        context, WelcomeScreen.routeName);
                  },
                )
              : SizedBox()
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
          child: FutureBuilder(
              future: AuthFunctions.readUserData(),
              builder: (context, snapshot) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AllUinScreen.routeName);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => AddUniScreen(),
                        //     ));
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
                    snapshot.data == null
                        ? const SizedBox()
                        : TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ProfileScreen.routeName);
                            },
                            child: Text(
                              'profile'.tr(),
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, ContactScreen.routeName);
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
                );
              }),
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
                    HomefirstStudentPart(),
                    MyDivider(text: "our-universities".tr()),
                    SizedBox(height: 20),
                    CategoryPart(),
                    SizedBox(height: 20),
                    TailPart()
                  ]))),
    );
  }
}
