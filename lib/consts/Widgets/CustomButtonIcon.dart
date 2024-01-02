import 'package:flutter/material.dart';

import 'subtitle.dart';

class CustomTextButtonIcon extends StatelessWidget {
  const CustomTextButtonIcon({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
  });
  final Function() onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: CustomSubTitle(subTitle: title, fontSize: 16));
  }
}
