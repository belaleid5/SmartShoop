import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Profile/userProvider.dart';
import 'package:shop_smart/Providers/ThemeProvider.dart';
import 'package:shop_smart/Services/assets_services_manger.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';
import 'package:shop_smart/widgets/profile/CustomButtonLogOut.dart';
import 'package:shop_smart/widgets/profile/CustomDivider.dart';
import 'package:shop_smart/widgets/profile/CustomListTile.dart';
import 'package:shop_smart/widgets/profile/CustomPersonData.dart';
import 'package:shop_smart/consts/Widgets/title.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fecthUserInfo(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themePrvider = Provider.of<ThemProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        titlepage: "Shop Smart",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userProvider.userModel == null
                ? const SizedBox.shrink()
                : CustomProfileData(),
            const SizedBox(
              height: 20,
            ),
            const CustomTitle(
              title: "General",
              fontSize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                return context.go("/allOrders");
              },
              child: const CustomListTile(
                urlImage: AssetsManger.bage_wish,
                title: "All Order",
              ),
            ),
            InkWell(
              onTap: () {
                return context.go("/wishlistScreen");
              },
              child: const CustomListTile(
                urlImage: AssetsManger.imageWishlist,
                title: "WishList",
              ),
            ),
            InkWell(
              onTap: () {
                return context.go('/viewRecently');
              },
              child: const CustomListTile(
                urlImage: AssetsManger.imageRecent,
                title: "Viewed Recent",
              ),
            ),
            const CustomListTile(
              urlImage: AssetsManger.imageAddress,
              title: "Address",
            ),
            const CustomDivider(),
            const CustomTitle(title: "Settings", fontSize: 20),
            const SizedBox(
              height: 20,
            ),
            SwitchListTile(
                secondary: Image.asset(
                  AssetsManger.imageTheme,
                  height: 40,
                ),
                title: Text(
                    themePrvider.getIsDarkTheme ? "Dark Mode" : "Light Mode"),
                value: themePrvider.getIsDarkTheme,
                onChanged: (change) {
                  themePrvider.setDarkTheme(change);
                }),
            const CustomDivider(),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CustomButtonLogOut(
                icon: Icon(IconlyBold.logout),
                colorButton: AppColor.redColor,
                paddingButton: 10,
                titleButton: "LogOut",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
