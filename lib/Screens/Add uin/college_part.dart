import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gam3ty/Screens/add%20college/college_info.dart';
import 'package:gam3ty/backend/add%20college/add_college_back.dart';
import 'package:google_fonts/google_fonts.dart';

class CollegePart extends StatefulWidget {
  final String id;

  const CollegePart({super.key, required this.id});

  @override
  State<CollegePart> createState() => _CollegePartState();
}

class _CollegePartState extends State<CollegePart> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollLeft() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset - 400,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollRight() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset + 400,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget buildImageCard(String? imagePath, String? name) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imagePath != null && imagePath.isNotEmpty
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : const Icon(Icons.image, size: 150),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  name ?? "Unknown College",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                    shadows: [
                      const Shadow(
                        blurRadius: 2,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'uni-college'.tr(),
                  style: GoogleFonts.domine(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Divider(thickness: 4, color: Colors.blue),
                ),
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: StreamBuilder(
                    stream: AddCollegeBack.getCollegeStream(widget.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "No colleges available",
                            style: GoogleFonts.domine(
                                fontSize: 18, color: Colors.red),
                          ),
                        );
                      }
                      return ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var college = snapshot.data![index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CollegeInfo.routeName,
                                arguments: college,
                              );
                            },
                            child: buildImageCard(
                              college.image,
                              college.nameAr,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: 40,
                        onPressed: scrollLeft,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: scrollRight,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
