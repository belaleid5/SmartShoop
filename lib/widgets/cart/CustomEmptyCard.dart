import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_smart/Services/assets_services_manger.dart';
import 'package:shop_smart/consts/Widgets/customButton.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/consts/Widgets/title.dart';

class CustomEmptyCart extends StatelessWidget {
  const CustomEmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsManger.imageShoppingBasket,
          height: size.height * 0.35,
          width: double.infinity,
        ),
        const CustomTitle(
          title: "Whoops",
          fontSize: 35,
          colorTitle: Colors.red,
        ),
        const SizedBox(
          height: 30,
        ),
        const CustomTitle(
          title: "Your Cart Is Empty",
          fontSize: 30,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomSubTitle(
          subTitle:
              "Looks like you didn`t add anything yet to your cart go ahead and start shopping now",
          fontSize: 20,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w300,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
          onPressed: () {
            return context.go("/home");
          },
          heightButton: 70,
          widthButton: 150,
          titleButton: "Shopp Now",
          fontWeight: FontWeight.bold,
          textColor: Colors.white,
          paddingButton: 20,
        ),
      ],
    );
  }
}
