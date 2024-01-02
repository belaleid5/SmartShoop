import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';

class CategoryRoundedWidget extends StatelessWidget {
  const CategoryRoundedWidget(
      {super.key, required this.nameImage, required this.image});

  final String nameImage;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return context.go(
          "/search/$nameImage",
        );
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
          ),
          CustomSubTitle(
            subTitle: nameImage,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
