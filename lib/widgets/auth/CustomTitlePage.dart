import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/CustomTitlePageShammer.dart';

class CustomTitlePage extends StatelessWidget {
  const CustomTitlePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              context.go("/login");
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColor.darkPrimary,
            )),
        Container(
          alignment: Alignment.topCenter,
          child: const CustomTitlePageShimmer(
            titlepage: 'ShoopSmart',
            sizeTitle: 30,
          ),
        ),
      ],
    );
  }
}
