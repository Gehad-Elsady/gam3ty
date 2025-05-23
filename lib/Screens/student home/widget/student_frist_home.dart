import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/backend/Auth/auth.dart';
import 'package:lottie/lottie.dart';

class HomefirstStudentPart extends StatelessWidget {
  const HomefirstStudentPart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthFunctions.readUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        var userData = snapshot.data;
        String userName = (userData != null &&
                userData.name != null &&
                userData.name!.isNotEmpty)
            ? userData.name!
            : ''; // Use localized string for "New User"

        return SizedBox(
          height: 400,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Side: Welcome Message
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 90, left: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'welcome-back'.tr(),
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' $userName 🎉\n',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'welcome-message-student'.tr(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right Side: Lottie Animation
              Expanded(
                flex: 1,
                child: Lottie.asset(
                  'assets/lotties/Animation - 1732380463541.json',
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
