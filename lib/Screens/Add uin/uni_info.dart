import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/college_part.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/Screens/add%20college/add_college.dart';
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
          showDialog(
            context: context,
            builder: (context) => AddCollegeScreen(),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add College',
                style: GoogleFonts.domine(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Icon(
              Icons.add_circle_outline_sharp,
              size: 50,
              color: Colors.black,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          model.uinNameEn,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Horizontal Scrollable Row for dynamic content
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            "University Student",
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
                      SizedBox(width: 100),

                      // Faculty Member Section
                      Column(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/teacher.png"),
                            size: 200,
                          ),
                          SizedBox(height: 18),
                          Text(
                            "Faculty Member",
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
                      SizedBox(width: 100),

                      // University College Section
                      Column(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/college.png"),
                            size: 200,
                          ),
                          SizedBox(height: 18),
                          Text(
                            "University College",
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
                    ],
                  ),

                  Spacer(),

                  // Container for the Image
                  Container(
                    height: 500,
                    width: 500,
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
                              'Basics Information',
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
                          Text("Universty President:",
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(model.universityPresidentEn,
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("Address:",
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 8),
                          Text(model.addressEn,
                              style: GoogleFonts.domine(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text("University Massage:",
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(width: 8),
                      Text(model.descriptionEn,
                          style: GoogleFonts.domine(
                            fontSize: 20,
                            color: Colors.black,
                          )),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text("Establish Date:",
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
                              'Applying Information',
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
                          Text("Accepted Percentage Start From:",
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
                          Text("Areas you can join:",
                              style: GoogleFonts.domine(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight:
                                    FontWeight.bold, // Bold for the label
                              )),
                          const SizedBox(width: 8),
                          Text(
                              model.allowCitiesEn
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
                          Text("Studying Type:",
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
                              'Advantage and Disadvantage',
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
                      Text("University Advantage:",
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Bold for the label
                          )),
                      const SizedBox(width: 8),
                      Text(
                        model.advantagesEn
                            .map((item) =>
                                "• $item") // Add bullet point before each item
                            .join("\n"), // Join each item with a newline
                        style: GoogleFonts.domine(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Bold for the items
                        ),
                      ),

                      const SizedBox(height: 8),
                      Text("University Disadvantage:",
                          style: GoogleFonts.domine(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Bold for the label
                          )),
                      const SizedBox(width: 8),
                      Text(
                        model.disadvantagesEn
                            .map((item) =>
                                "• $item") // Add bullet point before each item
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
                              'Contact Information',
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
                          Text("University Phone Number:",
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
                          Text("University Website Link:",
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
                          Text("University Email:",
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
              CollegePart(
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
