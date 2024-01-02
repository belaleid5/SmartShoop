import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    required this.fontSize,
    this.colorTitle,
  });

  final String title;
  final double fontSize;
  final Color? colorTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: colorTitle,
      ),
    );
  }
}
