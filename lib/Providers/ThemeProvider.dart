import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemProvider with ChangeNotifier {
  bool isDarkThme = false;
  static const statusTheme = "THEME_STATUS";

  // ignore: non_constant_identifier_names
  ThemeProvider() {
    getTheme();
  }

  bool get getIsDarkTheme => isDarkThme;
  void setDarkTheme(
    bool themeValue,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(statusTheme, themeValue);
    isDarkThme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool(statusTheme) ?? false;
    notifyListeners();
    return isDarkThme;
  }
}
