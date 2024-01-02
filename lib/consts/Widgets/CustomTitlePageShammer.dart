import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomTitlePageShimmer extends StatelessWidget {
  const CustomTitlePageShimmer({
    super.key,
    required this.titlepage,
    this.sizeTitle,
  });

  final String titlepage;
  final double? sizeTitle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: Text(
        titlepage,
        style: TextStyle(color: Colors.black, fontSize: sizeTitle),
      ),
    );
  }
}
