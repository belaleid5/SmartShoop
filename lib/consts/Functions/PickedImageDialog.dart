import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/consts/Widgets/CustomButtonIcon.dart';

class MyFunctionsApp {
  static Future<void> pickedImageDailog({
    required BuildContext context,
    required Function cameraFCT,
    required Function galleryFCT,
    required Function removeFCT,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          final Size size = MediaQuery.of(context).size;

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            icon: const Icon(IconlyBold.camera),
            content: SizedBox(
              height: size.height * 0.23,
              child: Column(
                children: [
                  Consumer(builder: (context, myData, child) {
                    return CustomTextButtonIcon(
                      onPressed: () async {
                        cameraFCT();
                        if (context.canPop() == true) {
                          context.pop();
                        }
                      },
                      title: 'Camera',
                      icon: Icons.camera_enhance,
                    );
                  }),
                  Consumer(builder: (context, myData, child) {
                    return CustomTextButtonIcon(
                      onPressed: () async {
                        galleryFCT();
                        if (context.canPop() == true) {
                          context.pop();
                        }
                      },
                      title: 'Gallery',
                      icon: Icons.browse_gallery,
                    );
                  }),
                  Consumer(builder: (context, myData, child) {
                    return CustomTextButtonIcon(
                      onPressed: () {
                        removeFCT();
                        if (context.canPop() == true) {
                          context.pop();
                        }
                      },
                      title: 'remove',
                      icon: Icons.remove,
                    );
                  }),
                ],
              ),
            ),
          );
        });
  }
}
