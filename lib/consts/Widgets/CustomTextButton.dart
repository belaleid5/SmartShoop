import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.fontSize,
    this.color,
    this.decoration,
  });
  final String title;
  final Function() onPressed;
  final double fontSize;
  final Color? color;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: color, fontSize: fontSize, decoration: decoration),
        ));
  }
}
