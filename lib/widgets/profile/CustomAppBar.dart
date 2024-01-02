import 'package:flutter/material.dart';
import 'package:shop_smart/Services/assets_services_manger.dart';
import 'package:shop_smart/consts/Widgets/CustomTitlePageShammer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    required this.titlepage,
    this.leading,
  });

  final List<Widget>? actions;
  final String titlepage;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: actions,
      leading: leading,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Row(
        children: [
          Image.asset(
            AssetsManger.imageShoppingCart,
            height: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          CustomTitlePageShimmer(titlepage: titlepage),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
