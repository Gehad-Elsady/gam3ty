import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/Screens/Add%20uin/uni_info.dart';
import 'package:gam3ty/backend/Add%20uni/add_uni_back.dart';

class SecondHomePart extends StatefulWidget {
  // static const String routeName = 'second-home-part';
  const SecondHomePart({super.key});

  @override
  State<SecondHomePart> createState() => _SecondHomePartState();
}

class _SecondHomePartState extends State<SecondHomePart> {
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
  ) {
    return SizedBox(
      height: 300,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: imagePath != null && imagePath.isNotEmpty
              ? Image.network(imagePath, fit: BoxFit.cover)
              : const Icon(Icons.image, size: 150),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AddUniBack.getUniStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        var universities = snapshot.data!;

        return Stack(
          children: [
            SizedBox(
              height: 300, // Fixed height for the ListView
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: universities.length,
                itemBuilder: (context, index) {
                  var uni = universities[index];
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => UniInfo(
                      //               arguments: universities[index],
                      //             )));
                      Navigator.pushNamed(context, UniInfo.routeName,
                          arguments: uni);
                    },
                    child: buildImageCard(
                      uni.image,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_left, size: 50, color: Colors.black),
                onPressed: scrollLeft,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_right,
                    size: 50, color: Colors.black),
                onPressed: scrollRight,
              ),
            ),
          ],
        );
      },
    );
  }
}
