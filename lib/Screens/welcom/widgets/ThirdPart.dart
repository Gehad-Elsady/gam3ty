import 'package:flutter/material.dart';

class ThirdPart extends StatelessWidget {
  const ThirdPart({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image paths
    final List<String> imagePaths = [
      "assets/images/جامعة-الجلالة.png",
      "assets/images/جامعة-شرم-الشيخ-كل-ما-تحتاج-معرفته-عنها.jpg",
      "assets/images/logoun.jpg",
      "assets/images/images.jpg",
      "assets/images/Helwan_University_Logo.jpg",
      "assets/images/20170618213743!شعار_جامعة_القاهرة_الجديد.jpg",
      "assets/images/images.png",
      "assets/images/october-6-university-1.png",
      "assets/images/Ain_Shams_logo.png",
      "assets/images/ImageHandler.png",
      "assets/images/ImageHandler (1).png",
      "assets/images/ImageHandler (2).png",
      "assets/images/ImageHandler (3).png",
      "assets/images/AU+REC+logos+-+2022-03-30T152444.942.png",
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Card containing all images
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.teal,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // Adjust the number of columns
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 16), // Spacing between the card and text
          // Text Explanation
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Universities We Support",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Our platform collaborates with a variety of renowned universities, offering you access to many colleges and programs.\n"
                  "From top engineering schools to prestigious art academies, you can explore diverse options and apply to the college of your choice seamlessly.\n"
                  "Join us to take the next step in your educational journey.",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
