import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Profile/ViewRecentProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/widgets/cart/CustomEmptyCard.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';
import 'package:shop_smart/widgets/search/CustomCardWidget.dart';

class ViewRecently extends StatelessWidget {
  const ViewRecently({super.key});

  @override
  Widget build(BuildContext context) {
    final viewRecentProvider = Provider.of<ViewRecentProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        titlepage:
            "ViewRecently (${viewRecentProvider.getViewRecentItems.length})",
        leading: IconButton(
            onPressed: () {
              context.go("/");
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: viewRecentProvider.getViewRecentItems.isEmpty
                  ? AppColor.lightScaffoldColor
                  : AppColor.darkPrimary,
            )),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 2),
            decoration: BoxDecoration(
                color: AppColor.darkPrimary,
                borderRadius: BorderRadius.circular(16)),
            child: const Icon(
              Icons.delete_forever_outlined,
            ),
          ),
        ],
      ),
      body: viewRecentProvider.getViewRecentItems.isEmpty
          ? const CustomEmptyCart()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: DynamicHeightGridView(
                    itemCount: viewRecentProvider.getViewRecentItems.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    builder: (ctx, index) {
                      return CustomCardWidget(
                        productId: viewRecentProvider.getViewRecentItems.values
                            .toList()[index]
                            .productid,
                      );
                    }),
              ),
            ),
    );
  }
}
