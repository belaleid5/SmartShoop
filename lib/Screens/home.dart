import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/consts/Widgets/title.dart';
import 'package:shop_smart/consts/constant.dart';
import 'package:shop_smart/widgets/Home/CategoryRoundeWidget.dart';
import 'package:shop_smart/widgets/Home/CustomLatestArival.dart';
import 'package:shop_smart/widgets/Home/CustomProductSwiper.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(titlepage: "Shop Smart"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProductSwiper(size: size),
              const SizedBox(
                height: 20,
              ),
              const CustomTitle(title: "Latest arrival", fontSize: 22),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.16,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productProvider.getProduct.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: productProvider.getProduct[index],
                        child: CustomLatestArival(
                          size: size,
                          productId:
                              productProvider.getProduct[index].productId,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTitle(title: "Categories", fontSize: 22),
              const SizedBox(
                height: 15,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children:
                    List.generate(AppConstatnt.categoryList.length, (index) {
                  return CategoryRoundedWidget(
                      nameImage: AppConstatnt.categoryList[index].nameImage,
                      image: AppConstatnt.categoryList[index].image);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
