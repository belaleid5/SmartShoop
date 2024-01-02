import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Profile/WishListProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';

class CustomFavoriteHeart extends StatelessWidget {
  const CustomFavoriteHeart({
    super.key,
    required this.productId,
  });

  final String productId;
  @override
  Widget build(BuildContext context) {
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);
    return IconButton(
        onPressed: () {
          wishListProvider.addOrRemoveLocal(productId: productId);
        },
        icon: wishListProvider.isProductInWishlist(
          productId: productId,
        )
            ? const Icon(
                IconlyBold.heart,
                color: AppColor.redColor,
              )
            : const Icon(IconlyLight.heart));
  }
}
