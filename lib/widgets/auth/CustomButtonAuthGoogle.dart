import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({
    super.key,
    required this.size,
    required this.image,
    required this.titleButtn,
    this.colorImage,
    required this.buttonColor,
    this.textColor,
    this.onPressed,
  });

  final Size size;
  final String image;
  final String titleButtn;
  final Color? colorImage;
  final Color buttonColor;
  final Color? textColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.black.withOpacity(0.5),
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: size.height / 30,
              color: colorImage,
            ),
            Text(
              titleButtn,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
          ],
        ));
  }
}
