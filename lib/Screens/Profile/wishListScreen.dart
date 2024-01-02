import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Profile/WishListProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Functions/ShowAlertDialog.dart';
import 'package:shop_smart/widgets/cart/CustomEmptyCard.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';
import 'package:shop_smart/widgets/search/CustomCardWidget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        titlepage: "WishList (${wishListProvider.getWishList.length})",
        leading: IconButton(
            onPressed: () {
              context.go("/");
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color:
                  isEmpty ? AppColor.lightScaffoldColor : AppColor.darkPrimary,
            )),
        actions: [
          IconButton(
            onPressed: () {
              myShowDialog(context, size,
                  titleButton: "Clear", titleDialog: "Clear Items", ftc: () {
                wishListProvider.clearAllItemLocal();
                context.pop(context);
              });
            },
            icon: const Icon(
              Icons.delete_forever_outlined,
              color: AppColor.redColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: wishListProvider.getWishList.isEmpty
          ? const CustomEmptyCart()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: DynamicHeightGridView(
                    itemCount: wishListProvider.getWishList.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    builder: (ctx, index) {
                      return CustomCardWidget(
                        productId: wishListProvider.getWishList.values
                            .toList()[index]
                            .productId,
                      );
                    }),
              ),
            ),
    );
  }
}
