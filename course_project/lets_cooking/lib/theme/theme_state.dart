import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  var _theme = ThemeMode.light;

  ThemeMode get theme => _theme;

  bool get isDark => _theme == ThemeMode.dark;

  void setLightTheme() {
    _theme = ThemeMode.light;
    notifyListeners();
  }

  void setDarkTheme() {
    _theme = ThemeMode.dark;
    notifyListeners();
  }
}
