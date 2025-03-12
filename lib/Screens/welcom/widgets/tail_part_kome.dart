import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TailPart extends StatelessWidget {
  const TailPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45.0, top: 15),
                child: Row(
                  children: [
                    Text(
                      'website'.tr(),
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff90E0EF),
                      ),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("We will add it soon 🔜"),
                            ),
                          );
                        },
                        icon: FaIcon(FontAwesomeIcons.facebookF),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff90E0EF),
                      ),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("We will add it soon 🔜"),
                            ),
                          );
                        },
                        icon: FaIcon(FontAwesomeIcons.twitter),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff90E0EF),
                      ),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("We will add it soon 🔜"),
                            ),
                          );
                        },
                        icon: FaIcon(FontAwesomeIcons.linkedin),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff90E0EF),
                      ),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("We will add it soon 🔜"),
                            ),
                          );
                        },
                        icon: FaIcon(FontAwesomeIcons.instagram),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35.0, top: 15),
                child: Text(
                  "quick-links".tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Product Sans",
                      fontSize: 20),
                  textAlign: TextAlign.right,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "services".tr(),
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.right,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "about-us".tr(),
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.right,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "contact-us".tr(),
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100.0, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: Text(
                    "address".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Product Sans",
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Main Office of the Design Agency.\nAirport Road\nUnited Arab Emirates",
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
