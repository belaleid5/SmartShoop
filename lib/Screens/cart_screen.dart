import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Functions/ShowAlertDialog.dart';
import 'package:shop_smart/widgets/cart/CustomCartWidget.dart';
import 'package:shop_smart/widgets/cart/CustomCkeckOut.dart';
import 'package:shop_smart/widgets/cart/CustomEmptyCard.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartitems.isEmpty
        ? const CustomEmptyCart()
        : Scaffold(
            bottomSheet: const CustomCheckOut(),
            appBar: CustomAppBar(
              titlepage: "Cart (${cartProvider.getCartitems.length})",
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    onPressed: () {
                      myShowDialog(context, size,
                          titleButton: "Clear",
                          titleDialog: "Clear Items", ftc: () {
                        cartProvider.clearLocalItems();
                        context.pop(context);
                      });
                    },
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: AppColor.redColor,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartProvider.getCartitems.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: cartProvider.getCartitems.values
                                .toList()
                                .reversed
                                .toList()[index],
                            child: CustomCartWidget(size: size));
                      }),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                )
              ],
            ));
  }
}
