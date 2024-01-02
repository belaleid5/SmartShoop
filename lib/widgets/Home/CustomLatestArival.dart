import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Models/product_models.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/Providers/Profile/ViewRecentProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/widgets/cart/CustomFavoriteHeart.dart';

class CustomLatestArival extends StatelessWidget {
  const CustomLatestArival({
    super.key,
    required this.size,
    required this.productId,
  });

  final Size size;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final productModels = Provider.of<ProductModel>(context);
    final viewRecentProvider = Provider.of<ViewRecentProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findByProductId(productId);
    return InkWell(
      onTap: () {
        viewRecentProvider.addViewRecentItems(
            productId: productModels.productId);
        context.go(
          "/deatiles/${getCurrentProduct!.productId}",
        );
      },
      child: SizedBox(
        width: size.width * 0.50,
        height: size.height * 0.14,
        child: Card(
            color: AppColor.lightCardColor.withOpacity(0.9),
            child: Row(
              children: [
                Image.network(
                  productModels.productImage,
                  width: size.width * 0.2,
                  height: size.height * 0.1,
                  fit: BoxFit.fill,
                ),
                Flexible(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Flexible(
                          child: CustomSubTitle(
                              overflow: TextOverflow.values[2],
                              subTitle: productModels.productTitle,
                              fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart_checkout)),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomFavoriteHeart(
                            productId: productModels.productId,
                          ),
                        ],
                      ),
                      CustomSubTitle(
                          subTitle: "${productModels.productPrice}\$",
                          color: AppColor.darkPrimary,
                          fontSize: 14),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
/* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.library_add_check),
                  Icon(IconlyBold.heart),
                ],
              ),*/



              /*Image.network(
            productModels.productImage,
            height: size.height,
            fit: BoxFit.cover,
          ),*/

          /*Column(
            children: [
              CustomSubTitle(
                  subTitle: productModels.productTitle,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              const
              const SizedBox(
                height: 10,
              ),
              CustomSubTitle(
                  subTitle: "${productModels.productPrice}\$",
                  color: AppColor.blueColor,
                  fontSize: 14),
            ],
          ),*/