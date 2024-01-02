import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/Providers/Profile/ViewRecentProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/widgets/cart/CustomFavoriteHeart.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findByProductId(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewRecentProvider = Provider.of<ViewRecentProvider>(context);

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () {
                      viewRecentProvider.addViewRecentItems(
                          productId: productId);
                      context.go(
                        "/deatiles/${getCurrentProduct.productId}",
                      );
                    },
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomSubTitle(
                          overflow: TextOverflow.ellipsis,
                          subTitle: getCurrentProduct.productTitle,
                          fontSize: 16),
                    ),
                    CustomFavoriteHeart(
                      productId: getCurrentProduct.productId,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSubTitle(
                        subTitle: getCurrentProduct.productPrice, fontSize: 14),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(16),
                          color: cartProvider.isProductInCart(
                                  productId: getCurrentProduct.productId)
                              ? AppColor.redColor
                              : AppColor.darkPrimary,
                          child: IconButton(
                            onPressed: () {
                              if (cartProvider.isProductInCart(
                                  productId: getCurrentProduct.productId)) {
                                return;
                              }
                              return cartProvider.addProductToCart(
                                  productId: productId);
                            },
                            icon: Icon(
                              cartProvider.isProductInCart(
                                      productId: getCurrentProduct.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_rounded,
                            ),
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
