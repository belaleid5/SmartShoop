import 'package:flutter/material.dart';
import 'package:shop_smart/consts/AppColor.dart';

class AppStyles {
  static ThemeData themeData({required bool isDarkTheme, required context}) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? AppColor.darkScaffoldColor
          : AppColor.lightScaffoldColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 13, 6, 37)
          : AppColor.lightCardColor,
    );
  }
}
