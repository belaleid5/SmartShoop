import 'package:flutter/material.dart';

class CustmImageNetWork extends StatelessWidget {
  const CustmImageNetWork({
    super.key,
    required this.urImage,
    required this.size,
  });
  final String urImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urImage,
      height: size,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
