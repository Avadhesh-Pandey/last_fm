import 'package:flutter/material.dart';
import 'package:last_fm/features/presentation/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData td) {
    _themeData = td;
    notifyListeners();
  }

  void setTheme(String? theme) {
    if (theme == "light") {
      themeData = lightMode;
    } else {
      themeData = darkMode;
    }
  }
}
