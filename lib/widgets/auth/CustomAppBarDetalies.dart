import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/title.dart';
import 'package:shop_smart/widgets/cart/CustomFavoriteHeart.dart';

class CustomAppBarDetailes extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarDetailes({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                return context.replace("/");
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          const Spacer(),
          Shimmer.fromColors(
            baseColor: Colors.purple,
            highlightColor: Colors.red,
            child: const CustomTitle(
              title: "SmartShop",
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Badge.count(
            count: 4,
            child: Shimmer.fromColors(
              baseColor: Colors.purple,
              highlightColor: Colors.red,
              child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.blueColor.withOpacity(0.3),
                  ),
                  child: CustomFavoriteHeart(productId: productId)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
