import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/widgets/cart/CustomEmptyCard.dart';
import 'package:shop_smart/widgets/profile/AllOrdersWidget.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                return context.go('/');
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: AppColor.darkPrimary,
              )),
          titlepage: 'Shop Smart'),
      body: isEmpty ? const CustomEmptyCart() : AllOrdersWidget(size: size),
    );
  }
}
