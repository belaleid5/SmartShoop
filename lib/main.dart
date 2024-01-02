import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Auth/ForgetPassword.dart';
import 'package:shop_smart/Providers/Auth/LoginProvider.dart';
import 'package:shop_smart/Providers/Auth/RegisterProvider.dart';
import 'package:shop_smart/Providers/BottomNavProvider.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:shop_smart/Providers/Profile/ViewRecentProvider.dart';
import 'package:shop_smart/Providers/Profile/WishListProvider.dart';
import 'package:shop_smart/Providers/Profile/userProvider.dart';
import 'package:shop_smart/Providers/SearchProviders/SearchPrivders.dart';
import 'package:shop_smart/Providers/ThemeProvider.dart';
import 'package:shop_smart/consts/Router.dart';
import 'package:shop_smart/consts/styles.dart';
import 'package:shop_smart/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemProvider>(create: (_) => ThemProvider()),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (_) => BottomNavigationBarProvider()),
        ChangeNotifierProvider<SearchProviders>(
            create: (_) => SearchProviders()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<RegisterProvider>(
            create: (_) => RegisterProvider()),
        ChangeNotifierProvider<ForgetPasswordProvider>(
            create: (_) => ForgetPasswordProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
        ChangeNotifierProvider<WishListProvider>(
            create: (_) => WishListProvider()),
        ChangeNotifierProvider<ViewRecentProvider>(
            create: (_) => ViewRecentProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: Consumer<ThemProvider>(builder: (context, themeVlaue, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppStyles.themeData(
              isDarkTheme: themeVlaue.getIsDarkTheme, context: context),
          routerConfig: router,
        );
      }),
    );
  }
}
