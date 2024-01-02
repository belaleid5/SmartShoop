import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';

class CustomAddedToCart extends StatelessWidget {
  const CustomAddedToCart({
    super.key,
    required this.onPressed,
    required this.productId,
  });
  final Function() onPressed;

  final String productId;

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final getCurrentProduct = productProvider.findByProductId(productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 10, horizontal: 60)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(16), // Set the border radius to 10
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color?>(
                AppColor.darkPrimary), // Set the button background color to red
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                cartProvider.isProductInCart(
                        productId: getCurrentProduct!.productId)
                    ? Icons.check
                    : Icons.shopping_cart_checkout,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: CustomSubTitle(
                  textAlign: TextAlign.center,
                  subTitle: cartProvider.isProductInCart(
                          productId: getCurrentProduct.productId)
                      ? "In Cart"
                      : ' add to Cart',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
