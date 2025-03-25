import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/college_part.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/Screens/add%20college/add_college.dart';
import 'package:gam3ty/Screens/add%20college/model/college_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CollegeInfo extends StatefulWidget {
  static const String routeName = 'College-info';
  // final AddUinModel arguments;

  const CollegeInfo({super.key});

  @override
  State<CollegeInfo> createState() => _CollegeInfoState();
}

class _CollegeInfoState extends State<CollegeInfo> {
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as CollegeModel;
    Locale currentLocale = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentLocale.languageCode == 'en' ? model.nameEn : model.nameAr,
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Horizontal Scrollable Row for dynamic content

                  // Container for the Image
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20), // Ensure matching radius
                      child: Image.network(
                        model.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
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
                          Text("college-dean".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(
                              currentLocale.languageCode == 'en'
                                  ? model.collegePresidentEn
                                  : model.collegePresidentAr,
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
                      Text("college-massage".tr(),
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
                      const SizedBox(height: 16),

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
                      Row(
                        children: [
                          Text("academic-years".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(model.academicYear + "years".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text("tuition-fees".tr(),
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(model.Tuitionfees + "egp".tr(),
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
              // Admission Information Cards
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
                              'career-info'.tr(),
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
                      Text("career-opportunities".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Bold for the label
                          )),
                      const SizedBox(width: 8),
                      Text(
                        currentLocale.languageCode == 'en'
                            ? model.careerOpportunitiesEnList
                                .map((item) =>
                                    "• $item") // Add bullet point before each item
                                .join("\n")
                            : model.careerOpportunitiesArList
                                .map((item) => "• $item")
                                .join("\n"), // Join each item with a newline
                        style: GoogleFonts.domine(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Bold for the items
                        ),
                      ),

                      const SizedBox(height: 8),
                      Text("expected-jobs".tr(),
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Bold for the label
                          )),
                      const SizedBox(width: 8),
                      Text(
                        currentLocale.languageCode == 'en'
                            ? model.expectedJobsEn
                                .map((item) =>
                                    "• $item") // Add bullet point before each item
                                .join("\n")
                            : model.expectedJobsAr
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
                      Text("college-adv".tr(),
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
                      Text("college-dis".tr(),
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
                              'contact-info'.tr(),
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
                          Text("college-phone".tr(),
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
                          Text("college-website".tr(),
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
                          Text("college-email".tr(),
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
            ],
          ),
        ),
      ),
    );
  }
}
