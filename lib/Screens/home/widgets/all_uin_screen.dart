import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/uni_info.dart';
import 'package:gam3ty/backend/Add%20uni/add_uni_back.dart';
import 'package:google_fonts/google_fonts.dart';

class AllUinScreen extends StatelessWidget {
  static const String routeName = 'all-uin-screen';
  const AllUinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('all-universities'.tr(),
            style: GoogleFonts.domine(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                // StreamBuilder for fetching services
                StreamBuilder(
                  stream: AddUniBack.getUniStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Center(child: Text('No services available'));
                    } else {
                      // Sorting universities by establishment year (oldest to newest)
                      final sortedUniversities = List.from(snapshot.data!)
                        ..sort((a, b) =>
                            a.establishDate.compareTo(b.establishDate));
                      return GridView.builder(
                        shrinkWrap:
                            true, // Allows GridView to be scrollable within the SingleChildScrollView
                        physics:
                            NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: sortedUniversities.length,
                        itemBuilder: (context, index) {
                          final service = sortedUniversities[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, UniInfo.routeName,
                                  arguments: service);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16), // Rounded corners
                              ),
                              elevation: 5, // Shadow effect
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    16), // Rounded corners for the image
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Image section
                                    Expanded(
                                        child: Image.network(
                                      service.image,
                                      fit: BoxFit.contain,
                                    )),
                                    // Expanded(
                                    //   child: CachedNetworkImage(
                                    //     imageUrl: service.image,
                                    //     placeholder: (context, url) =>
                                    //         CircularProgressIndicator(),
                                    //     errorWidget: (context, url, error) =>
                                    //         Icon(Icons.error),
                                    //     fit: BoxFit.fill,
                                    //     width: double.infinity,
                                    //   ),
                                    // ),
                                    // Text for name and price
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            context.locale.languageCode == 'en'
                                                ? service.uinNameEn
                                                : service.uinNameAr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
