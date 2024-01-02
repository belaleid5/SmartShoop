import 'package:flutter/material.dart';
import 'package:shop_smart/Screens/Profile/profile_screen.dart';
import 'package:shop_smart/Screens/cart_screen.dart';
import 'package:shop_smart/Screens/home.dart';
import 'package:shop_smart/Screens/search_screen.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  final screns = const <Widget>[
    HomeScreen(),
    Search(),
    Cart(),
    Profile(),
  ];

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
