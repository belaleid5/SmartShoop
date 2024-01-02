import 'package:flutter/material.dart';
import 'package:shop_smart/consts/AppColor.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.paddingButton,
    required this.titleButton,
    this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    required this.widthButton,
    required this.heightButton,
  });

  final double paddingButton;
  final String titleButton;
  final Function()? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double widthButton;
  final double heightButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
                Size(widthButton, heightButton)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(15)),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColor.darkPrimary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))),
        onPressed: onPressed,
        child: Text(
          titleButton,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: fontWeight,
          ),
        ));
  }
}
