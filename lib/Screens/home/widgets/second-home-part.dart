import 'package:flutter/material.dart';

class SecondHomePart extends StatelessWidget {
  const SecondHomePart({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

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

    Widget buildImageCard(String imagePath, {BoxFit fit = BoxFit.contain}) {
      return SizedBox(
        height: 300,
        // width: 250,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: fit,
            ),
          ),
        ),
      );
    }

    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            children: [
              buildImageCard("assets/images/جامعة-الجلالة.png"),
              buildImageCard(
                "assets/images/جامعة-شرم-الشيخ-كل-ما-تحتاج-معرفته-عنها.jpg",
                fit: BoxFit.contain,
              ),
              buildImageCard("assets/images/logoun.jpg"),
              buildImageCard("assets/images/images.jpg"),
              buildImageCard("assets/images/Helwan_University_Logo.jpg"),
              buildImageCard(
                "assets/images/20170618213743!شعار_جامعة_القاهرة_الجديد.jpg",
              ),
              buildImageCard("assets/images/images.png"),
              buildImageCard("assets/images/october-6-university-1.png"),
              buildImageCard("assets/images/Ain_Shams_logo.png"),
              buildImageCard("assets/images/ImageHandler.png"),
              buildImageCard("assets/images/ImageHandler (1).png"),
              buildImageCard("assets/images/ImageHandler (2).png"),
              buildImageCard("assets/images/ImageHandler (3).png"),
              buildImageCard(
                "assets/images/AU+REC+logos+-+2022-03-30T152444.942.png",
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_left, size: 50, color: Colors.black),
            onPressed: scrollLeft,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_right, size: 50, color: Colors.black),
            onPressed: scrollRight,
          ),
        ),
      ],
    );
  }
}
