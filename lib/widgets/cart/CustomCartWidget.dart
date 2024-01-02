import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Models/cart_model.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/widgets/cart/CustomFavoriteHeart.dart';
import 'package:shop_smart/widgets/cart/CustomQuantityWidget.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/consts/Widgets/title.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartModelProvider = Provider.of<CartModel>(context);
    final productsProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct =
        productsProvider.findByProductId(cartModelProvider.productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: FancyShimmerImage(
                            height: size.height * 0.2,
                            width: size.height * 0.2,
                            imageUrl: getCurrProduct.productImage,
                          ),
                        ),
                      ),
                      IntrinsicWidth(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: size.width * 0.6,
                                      child: CustomTitle(
                                          title: getCurrProduct.productTitle,
                                          fontSize: 20)),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cartProvider.removeOneItem(
                                                producId:
                                                    getCurrProduct.productId);
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: AppColor.redColor,
                                          )),
                                      CustomFavoriteHeart(
                                        productId: getCurrProduct.productId,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  CustomTitle(
                                    title: "${getCurrProduct.productPrice}\$",
                                    fontSize: 16,
                                    colorTitle: AppColor.darkPrimary,
                                  ),
                                  const Spacer(),
                                  OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        side: const BorderSide(
                                          width: 2,
                                          color: AppColor.redColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            )),
                                            context: context,
                                            builder: (context) {
                                              return CustomQuantityWidget(
                                                size: size,
                                                cartModel: cartModelProvider,
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                        IconlyLight.arrowDown2,
                                        color: AppColor.redColor,
                                      ),
                                      label: CustomSubTitle(
                                          subTitle:
                                              "Qty : ${cartModelProvider.quantity}",
                                          fontSize: 16,
                                          color: AppColor.redColor,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
