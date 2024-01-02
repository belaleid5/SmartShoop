import 'package:go_router/go_router.dart';
import 'package:shop_smart/Screens/Auth/forget_password.dart';
import 'package:shop_smart/Screens/Auth/login_screen.dart';
import 'package:shop_smart/Screens/Auth/register.dart';
import 'package:shop_smart/Screens/Profile/all_order.dart';
import 'package:shop_smart/Screens/Profile/profile_screen.dart';
import 'package:shop_smart/Screens/Profile/view_recently.dart';
import 'package:shop_smart/Screens/deatlis_screen.dart';
import 'package:shop_smart/Screens/home.dart';
import 'package:shop_smart/Screens/root_mainScreen.dart';
import 'package:shop_smart/Screens/Profile/wishListScreen.dart';
import 'package:shop_smart/Screens/search_screen.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name:
          'root', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const RootMain(),
    ),
    GoRoute(
      name: 'deatiles',
      path: '/deatiles/:productId',
      builder: (context, state) => DeatilesProduct(
        productId: state.pathParameters["productId"]!,
      ),
    ),
    GoRoute(
      name: 'search',
      path: '/search/:category',
      builder: (context, state) => Search(
        category: state.pathParameters["category"]!,
      ),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    /*Auth Screens*/
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'regisetrScreen',
      path: '/regisetrScreen',
      builder: (context, state) => const RegisetrScreen(),
    ),
    GoRoute(
      name: 'forgetPassowrd',
      path: '/forgetPassowrd',
      builder: (context, state) => const ForgetPassword(),
    ),
    /*profie Screen*/
    GoRoute(
      name: 'wishlistScreen',
      path: '/wishlistScreen',
      builder: (context, state) => const WishlistScreen(),
    ),
    GoRoute(
      name: 'viewRecently',
      path: '/viewRecently',
      builder: (context, state) => const ViewRecently(),
    ),
    GoRoute(
      name: 'profile',
      path: '/profile',
      builder: (context, state) => const Profile(),
    ),
    GoRoute(
      name: 'allOrders',
      path: '/allOrders',
      builder: (context, state) => const AllOrders(),
    ),
  ],
);
