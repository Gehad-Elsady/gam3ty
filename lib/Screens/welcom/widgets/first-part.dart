import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'welcome'.tr(),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'website'.tr(),
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${'dis1'.tr()}\n'
                    '${'dis2'.tr()}\n'
                    '${'dis3'.tr()}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Lottie.asset(
            'assets/lotties/Animation - 1732189524601.json',
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ],
      ),
    );
  }
}
