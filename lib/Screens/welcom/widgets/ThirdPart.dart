import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ThirdPart extends StatefulWidget {
  const ThirdPart({super.key});

  @override
  State<ThirdPart> createState() => _ThirdPartState();
}

class _ThirdPartState extends State<ThirdPart> {
  @override
  Widget build(BuildContext context) {
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
                    crossAxisCount: 5,
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
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "supportuniversities".tr(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  '${'info1'.tr()}\n'
                  '${'info2'.tr()}\n'
                  '${'info3'.tr()}',
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
