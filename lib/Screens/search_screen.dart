import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Models/product_models.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/title.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';
import 'package:shop_smart/widgets/search/CustomCardWidget.dart';
import 'package:shop_smart/widgets/search/CustomSearchField.dart';
import 'package:shop_smart/widgets/search/CustomresultNotFound.dart';

class Search extends StatefulWidget {
  const Search({super.key, this.index, this.category});
  final int? index;

  final String? category;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<ProductModel> productSearchList = [];
  TextEditingController? serchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> ctgList = widget.category == null
        ? productProvider.getProduct
        : productProvider.findByCategoey(category: widget.category!);
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                return context.replace("/");
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColor.darkPrimary,
              )),
          titlepage: widget.category ?? "Search"),
      body:
          /*  ctgList.isEmpty
          ? const Center(
              child: CustomTitle(title: "Not Found Any Product", fontSize: 18))
          :*/

          StreamBuilder<List<ProductModel>>(
              stream: productProvider.fetchProductStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: CustomTitle(
                        title: snapshot.error.toString(), fontSize: 18),
                  );
                } else if (snapshot.data == null) {
                  return const Center(
                    child: CustomTitle(
                        title: "No product Has been added", fontSize: 18),
                  );
                }
                return Column(
                  children: [
                    CustomSearchField(
                      onSubmitted: (val) {
                        setState(() {
                          productSearchList = productProvider.searchQuery(
                              textSearch: serchController!.text,
                              passedList: ctgList);
                        });
                      },
                      controller: serchController!,
                      onTap: () {
                        serchController!.clear();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    if (serchController!.text.isNotEmpty &&
                        productSearchList.isEmpty) ...[
                      const CustomResultNotFound(),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                          itemCount: serchController!.text.isNotEmpty
                              ? productSearchList.length
                              : ctgList.length,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          builder: (ctx, index) {
                            return ChangeNotifierProvider.value(
                              value: ctgList[index],
                              child: CustomCardWidget(
                                productId: serchController!.text.isNotEmpty
                                    ? productSearchList[index].productId
                                    : ctgList[index].productId,
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }),
    );
  }
}
