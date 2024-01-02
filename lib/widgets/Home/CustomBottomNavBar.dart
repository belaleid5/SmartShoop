import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_smart/Providers/BottomNavProvider.dart';
import 'package:shop_smart/consts/Widgets/CustomBadge.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
    required this.bootmNavProvider,
    required this.pageController,
  });

  final BottomNavigationBarProvider bootmNavProvider;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: bootmNavProvider.currentIndex,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      onDestinationSelected: (index) {
        bootmNavProvider.currentIndex = index;
        pageController.jumpToPage(bootmNavProvider.currentIndex);
      },
      destinations: const [
        NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(
              IconlyLight.home,
            ),
            label: "Home"),
        NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: "Search"),
        NavigationDestination(
            selectedIcon: Icon(IconlyBold.bag2),
            icon: CustomBadge(),
            label: "Cart"),
        NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(
              IconlyLight.profile,
            ),
            label: "Profile"),
      ],
    );
  }
}
