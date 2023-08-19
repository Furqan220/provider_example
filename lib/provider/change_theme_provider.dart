import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangeThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode theme) {
    _themeMode = theme;
    notifyListeners();
  }
}
