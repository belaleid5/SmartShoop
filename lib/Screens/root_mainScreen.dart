import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/BottomNavProvider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/widgets/Home/CustomBottomNavBar.dart';

class RootMain extends StatefulWidget {
  const RootMain({super.key});

  @override
  State<RootMain> createState() => _RootMainState();
}

class _RootMainState extends State<RootMain> {
  bool isLoadingProd = true;
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchFCT() async {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);

    try {
      Future.wait({
        productsProvider.fetchProducts(),
      });
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  void didChangeDependencies() {
    if (isLoadingProd) {
      fetchFCT();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bootmNavProvider = Provider.of<BottomNavigationBarProvider>(context);
    final PageController pageController = PageController(
        initialPage: context.watch<BottomNavigationBarProvider>().currentIndex);
    return Scaffold(
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, bottomBarProvider, child) {
          return PageView(
            controller: pageController,
            children: bootmNavProvider.screns,
          );
        },
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
          bootmNavProvider: bootmNavProvider, pageController: pageController),
    );
  }
}
