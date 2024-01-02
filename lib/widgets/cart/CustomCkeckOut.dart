import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/customButton.dart';
import 'package:shop_smart/consts/Widgets/title.dart';

class CustomCheckOut extends StatelessWidget {
  const CustomCheckOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(width: 3, color: Colors.grey.shade400),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: kBottomNavigationBarHeight + 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitle(
                      title:
                          "Total (${cartProvider.getCartitems.length} / ${cartProvider.getQuantity()} Items)",
                      fontSize: 16),
                  const Spacer(),
                  CustomTitle(
                    title:
                        "\$ ${cartProvider.getTotla(productProvider: productProvider).toStringAsFixed(2)}",
                    fontSize: 16,
                    colorTitle: AppColor.darkPrimary,
                  ),
                ],
              ),
              const Spacer(),
              const CustomButton(
                  heightButton: 50,
                  widthButton: 100,
                  paddingButton: 15,
                  titleButton: "Check Out")
            ],
          ),
        ),
      ),
    );
  }
}
