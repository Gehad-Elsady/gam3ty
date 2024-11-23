import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SecondPart extends StatelessWidget {
  const SecondPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset(
          'assets/images/1029201912229pm422.jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/cc26055a-5aad-407b-83ed-6ab38992b0a9.jpeg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/ImageHandler (1).jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/ImageHandler.jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/istockphoto-1371896330-612x612.jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/pexels-pixabay-267885.jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/Screen-Shot-2017-11-27-at-2.04.29-AM-1752x800.jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/جامعة_حلوان.jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
        Image.asset(
          'assets/images/صورة واتساب بتاريخ 2024-11-03 في 13.37.58_e5552df8.jpg',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width, // Full width
        ),
      ],
      options: CarouselOptions(
        height: 500,
        viewportFraction: 1.0, // Make sure the image takes full width
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
