import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_smart/consts/Widgets/CustomTextButton.dart';
import 'package:shop_smart/consts/Widgets/title.dart';

class CustomGoToSignUp extends StatelessWidget {
  const CustomGoToSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTitle(
          title: "Don`t Have An Account",
          fontSize: 18,
          colorTitle: Colors.black.withOpacity(0.5),
        ),
        CustomTextButton(
          title: 'SignUP',
          onPressed: () {
            context.go("/regisetrScreen");
          },
          fontSize: 18,
          color: Colors.black.withOpacity(0.5),
          decoration: TextDecoration.underline,
        ),
      ],
    );
  }
}
