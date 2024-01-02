import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_smart/Services/assets_services_manger.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/CustomTextButton.dart';

import '../Widgets/subtitle.dart';

Future<dynamic> myShowDialog(BuildContext context, Size? size,
    {required dynamic Function() ftc,
    required String titleButton,
    required String titleDialog}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: CustomSubTitle(
            subTitle: titleDialog,
            fontSize: 16,
          ),
          icon: Image.asset(
            AssetsManger.imageWorning,
            height: size!.height * 0.12,
          ),
          content: Row(
            children: [
              CustomTextButton(
                title: 'Cancel',
                fontSize: 22,
                onPressed: () {
                  return context.pop(context);
                },
                color: Colors.green,
              ),
              const Spacer(),
              CustomTextButton(
                title: titleButton,
                fontSize: 22,
                onPressed: ftc,
                color: AppColor.redColor,
              ),
            ],
          ),
        );
      });
}
/* return context.pop("/");*/
