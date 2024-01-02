import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.urlImage,
    required this.title,
  });

  final String urlImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        urlImage,
        height: 30,
      ),
      title: CustomSubTitle(
        subTitle: title,
        fontSize: 18,
        fontWeight: FontWeight.w200,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
