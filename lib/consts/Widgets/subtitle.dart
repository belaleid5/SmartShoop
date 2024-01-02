import 'package:flutter/material.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({
    super.key,
    required this.subTitle,
    required this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.overflow,
  });

  final String subTitle;
  final TextAlign? textAlign;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight,
          letterSpacing: 0.3,
          color: color,
          fontSize: fontSize,
          overflow: overflow),
    );
  }
}
