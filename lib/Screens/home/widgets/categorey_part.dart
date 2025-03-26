import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/home/widgets/category_screen.dart';

class CategoryPart extends StatelessWidget {
  CategoryPart({super.key});

  final List<String> images = [
    "assets/images/20170618213743!شعار_جامعة_القاهرة_الجديد.jpg",
    "assets/images/Ain_Shams_logo.png",
    "assets/images/Helwan_University_Logo.jpg",
    "assets/images/ImageHandler.png"
  ];
  final List<String> images1 = [
    "assets/images/october-6-university-1.png",
    "assets/images/images.png",
    "assets/images/ImageHandler (1).png",
    "assets/images/ImageHandler (3).png"
  ];
  final List<String> images2 = [
    "assets/images/جامعة-شرم-الشيخ-كل-ما-تحتاج-معرفته-عنها.jpg",
    "assets/images/جامعة-الجلالة.png",
    "assets/images/ImageHandler (2).png",
  ];
  final List<String> images3 = [
    "assets/images/logo.webp",
    "assets/images/Higher_Technological_Institute.jpg",
    "assets/images/logo-th.jpg",
    "assets/images/WEBLOGOar.png"
  ];

  final List<String> images4 = [
    "assets/images/white-dtu-logo-ar.png",
    "assets/images/Logo-NCT-2.png",
    "assets/images/images (9).jpeg",
    "assets/images/logo.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CategoryScreen.routeName,
                    arguments: 'Government universities');
              },
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
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 15,
                          viewportFraction: 1.0,
                        ),
                        items: images.map((image) {
                          return Image.asset(
                            image,
                            fit: BoxFit.contain,
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "government-universities".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CategoryScreen.routeName,
                    arguments: 'Private universities');
              },
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
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 15,
                          viewportFraction: 1.0,
                        ),
                        items: images1.map((image) {
                          return Image.asset(
                            image,
                            fit: BoxFit.contain,
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "private-universities".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CategoryScreen.routeName,
                    arguments: 'national university');
              },
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
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 15,
                          viewportFraction: 1.0,
                        ),
                        items: images2.map((image) {
                          return Image.asset(
                            image,
                            fit: BoxFit.contain,
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "national-universities".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CategoryScreen.routeName,
                    arguments: 'Institutes');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 15,
                            viewportFraction: 1.0,
                          ),
                          items: images3.map((image) {
                            return Image.asset(
                              image,
                              fit: BoxFit.contain,
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            "institutes".tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CategoryScreen.routeName,
                    arguments: 'Technology University');
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 15,
                            viewportFraction: 1.0,
                          ),
                          items: images4.map((image) {
                            return Image.asset(
                              image,
                              fit: BoxFit.contain,
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            "technology-university".tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
}
