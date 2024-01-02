import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/CustomImageNetWork.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/consts/Widgets/title.dart';
import 'package:shop_smart/widgets/auth/CustomAppBarDetalies.dart';
import 'package:shop_smart/widgets/auth/CustomGoToCart.dart';
import 'package:shop_smart/widgets/cart/CustomFavoriteHeart.dart';
import 'package:shop_smart/widgets/profile/CustomDivider.dart';

class DeatilesProduct extends StatelessWidget {
  const DeatilesProduct({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final getCurrentProduct = productProvider.findByProductId(productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBarDetailes(
        productId: getCurrentProduct!.productId,
      ),
      // ignore: unnecessary_null_comparison
      body: getCurrentProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustmImageNetWork(
                        urImage: getCurrentProduct.productImage,
                        size: size.height * 0.35,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: CustomSubTitle(
                                  subTitle: getCurrentProduct.productTitle,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomSubTitle(
                              subTitle: "${getCurrentProduct.productPrice}\$",
                              fontSize: 20,
                              color: AppColor.darkPrimary.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.purple,
                          highlightColor: Colors.red,
                          child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColor.blueColor.withOpacity(0.3),
                              ),
                              child: CustomFavoriteHeart(
                                  productId: getCurrentProduct.productId)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomAddedToCart(
                          onPressed: () {
                            if (cartProvider.isProductInCart(
                                productId: getCurrentProduct.productId)) {
                              return;
                            }
                            return cartProvider.addProductToCart(
                                productId: productId);
                          },
                          productId: productId,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomTitle(
                                title: 'About this Item', fontSize: 18),
                            CustomSubTitle(
                                subTitle:
                                    "in ${getCurrentProduct.productCategory}",
                                fontSize: 16)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomSubTitle(
                            textAlign: TextAlign.start,
                            subTitle: getCurrentProduct.productDescription,
                            fontSize: 16),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomDivider(),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
