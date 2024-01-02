import 'package:flutter/material.dart';
import 'package:shop_smart/consts/Widgets/CustomTextButton.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CustomTextButton(
        title: 'Forget Passowrd',
        onPressed: () {},
        fontSize: 18,
        color: Colors.black.withOpacity(0.5),
        decoration: TextDecoration.underline,
      ),
    );
  }
}
