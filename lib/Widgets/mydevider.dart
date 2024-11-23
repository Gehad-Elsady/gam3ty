// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDivider extends StatelessWidget {
  String text;
  MyDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffffffff),
            thickness: 5,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(text,
                style: GoogleFonts.domine(
                  color: Color(0xffffffff),
                  fontSize: 30,
                ))),
        Expanded(
          child: Divider(
            color: Color(0xffffffff),
            thickness: 5,
          ),
        ),
      ],
    );
  }
}
