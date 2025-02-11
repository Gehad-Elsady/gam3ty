import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/add%20college/college_info.dart';
import 'package:gam3ty/backend/add%20college/add_college_back.dart';
import 'package:google_fonts/google_fonts.dart';

class CollegePart extends StatefulWidget {
  CollegePart({
    super.key,
    required this.id,
  });
  String id;
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

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 400,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 400,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget buildImageCard(
    String? imagePath,
    String? name,
  ) {
    return SizedBox(
      height: 300,
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
                      width: 300,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      '${name}',
                      style: GoogleFonts.amiri(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
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
      child: Container(
        padding:
            const EdgeInsets.all(16.0), // Padding around the entire container
        child: StreamBuilder(
            stream: AddCollegeBack.getCollegeStream(widget.id),
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0), // Padding below the title
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'University College',
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
                  SizedBox(
                    height: 300, // Fixed height for the ListView
                    child: ListView.builder(
                      // controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var college = snapshot.data![index];
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => UniInfo(
                            //               arguments: universities[index],
                            //             )));
                            Navigator.pushNamed(context, CollegeInfo.routeName,
                                arguments: college);
                          },
                          child: buildImageCard(
                            college.image,
                            college.nameAr,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
