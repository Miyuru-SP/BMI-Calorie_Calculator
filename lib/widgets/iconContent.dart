import 'package:flutter/material.dart';
import 'package:medical_app/widgets/const.dart';

const sizedBox = SizedBox(
  height: 15.0,
);

const iconSize = 80.0;

class IconContent extends StatelessWidget {
  final IconData myicon;
  final String text;
  final Color iconColor;
  IconContent(
      {required this.myicon, required this.text, required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myicon,
          size: iconSize,
          color: iconColor,
        ),
        sizedBox,
        Text(
          text,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
