import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/college_part.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/Screens/Auth/login/login-screen.dart';
import 'package:gam3ty/Screens/add%20college/add_college.dart';
import 'package:gam3ty/Screens/payment-scree.dart';
import 'package:gam3ty/Screens/uni_location.dart';
import 'package:gam3ty/backend/add%20college/add_college_back.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UniInfo extends StatefulWidget {
  static const String routeName = 'uni-info';
  // final AddUinModel arguments;

  const UniInfo({super.key});

  @override
  State<UniInfo> createState() => _UniInfoState();
}

class _UniInfoState extends State<UniInfo> {
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as AddUinModel;
    Locale currentLocale = context.locale;
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 16),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.black),
          ),
        ),
        onPressed: () {
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PaymentScreen(totalPrice: int.parse(model.filePrice)),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('error'.tr()),
                content: Text('error-massage'.tr()),
                actions: [
                  TextButton(
                      child: Text('login'.tr()),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      }),
                  TextButton(
                    child: Text('cancel'.tr()),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('apply'.tr(),
                style: GoogleFonts.domine(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          currentLocale.languageCode == 'en'
              ? model.uinNameEn
              : model.uinNameAr,
          style: GoogleFonts.domine(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff90E0EF),
        centerTitle: true,
      ),
      body: Container(
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
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 80),

                    // University Student Section
                    Column(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/graduation.png"),
                          size: 200,
                        ),
                        SizedBox(height: 18),
                        Text(
                          "uni-student".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          model.numberOfStudents,
                          style: GoogleFonts.domine(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),

                    // Faculty Member Section
                    Column(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/teacher.png"),
                          size: 200,
                        ),
                        SizedBox(height: 18),
                        Text(
                          "uni-member".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          model.numberOfTeachers,
                          style: GoogleFonts.domine(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),

                    // University College Section
                    Column(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/college.png"),
                          size: 200,
                        ),
                        SizedBox(height: 18),
                        Text(
                          "uni-college".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          model.numberOfColleges,
                          style: GoogleFonts.domine(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),

                    // Image Container
                    Container(
                      height: 500,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(20), // Ensure matching radius
                        child: Image.network(
                          model.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              // Information Cards
              Card(
                child: Container(
                  padding: const EdgeInsets.all(
                      16.0), // Padding around the entire container
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // Title Section
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Padding below the title
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'basics-info'.tr(),
                              style: GoogleFonts.domine(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Divider(
                                thickness: 4,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Content Section
                      Row(
                        children: [
                          Text("uni-president".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(
                              currentLocale.languageCode == 'en'
                                  ? model.universityPresidentEn
                                  : model.universityPresidentAr,
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("uni-address".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(
                              currentLocale.languageCode == 'en'
                                  ? model.addressEn
                                  : model.addressAr,
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text("uni-message".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(width: 8),
                      Text(
                          currentLocale.languageCode == 'en'
                              ? model.descriptionEn
                              : model.descriptionAr,
                          style: GoogleFonts.domine(
                            fontSize: 20,
                            color: Colors.black,
                          )),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text("uni-establish-date".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(model.establishDate,
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Apply Information Cards
              Card(
                child: Container(
                  padding: const EdgeInsets.all(
                      16.0), // Padding around the entire container
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // Title Section
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Padding below the title
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'apply-info'.tr(),
                              style: GoogleFonts.domine(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Divider(
                                thickness: 4,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Content Section
                      Row(
                        children: [
                          Text("accepted-percentage".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text("${model.acceptedPercentage} %",
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("areas-join".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight:
                                    FontWeight.bold, // Bold for the label
                              )),
                          const SizedBox(width: 8),
                          Text(
                              currentLocale.languageCode == 'en'
                                  ? model.allowCitiesEn.join(", ")
                                  : model.allowCitiesAr
                                      .join(", "), // Join cities if it's a list
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight:
                                    FontWeight.bold, // Bold for the cities too
                              )),
                        ],
                      ),

                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("studying-type".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(model.studyingType,
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Advantage and Disadvantage Information Cards
              Card(
                child: Container(
                  padding: const EdgeInsets.all(
                      16.0), // Padding around the entire container
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // Title Section
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Padding below the title
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'adv-disadv'.tr(),
                              style: GoogleFonts.domine(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Divider(
                                thickness: 4,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Content Section
                      const SizedBox(height: 8),
                      Text("uni-adv".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Bold for the label
                          )),
                      const SizedBox(width: 8),
                      Text(
                        currentLocale.languageCode == 'en'
                            ? model.advantagesEn
                                .map((item) =>
                                    "• $item") // Add bullet point before each item
                                .join("\n")
                            : model.advantagesAr
                                .map((item) => "• $item")
                                .join("\n"), // Join each item with a newline
                        style: GoogleFonts.domine(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Bold for the items
                        ),
                      ),

                      const SizedBox(height: 8),
                      Text("uni-dis".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Bold for the label
                          )),
                      const SizedBox(width: 8),
                      Text(
                        currentLocale.languageCode == 'en'
                            ? model.disadvantagesEn
                                .map((item) =>
                                    "• $item") // Add bullet point before each item
                                .join("\n")
                            : model.disadvantagesAr
                                .map((item) => "• $item")
                                .join("\n"), // Join each item with a newline
                        style: GoogleFonts.domine(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Bold for the items
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              // Contact Information Cards
              Card(
                child: Container(
                  padding: const EdgeInsets.all(
                      16.0), // Padding around the entire container
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // Title Section
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Padding below the title
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'uni-contact'.tr(),
                              style: GoogleFonts.domine(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Divider(
                                thickness: 4,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Content Section
                      Row(
                        children: [
                          Text("uni-phone".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text("${model.contactNumber}",
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("uni-website".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight:
                                    FontWeight.bold, // Bold for the label
                              )),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () async {
                              final Uri uri = Uri.parse(model.uniLink);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Could not launch ${model.uniLink}')),
                                );
                              }
                            },
                            child: Text(model.uniLink,
                                style: GoogleFonts.domine(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                )),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("uni-email".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(model.email,
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              model.uniType == 'Institutes'
                  ? SizedBox()
                  : CollegePart(
                      id: model.id,
                    ),
              Card(
                child: Container(
                  height: 300,
                  width: 500,
                  padding: const EdgeInsets.all(
                      16.0), // Padding around the entire container
                  child: UniLocation(
                      latitude: double.parse(model.latitude!),
                      longitude: double.parse(model.longitude!)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
