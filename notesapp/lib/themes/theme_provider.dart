import 'package:flutter/material.dart';
import 'package:notesapp/themes/theme.dart';

class ThemeProvider with ChangeNotifier {
  // initially theme is light mode

  ThemeData _themeData = lightMode;
  // getter method to get theme from other parts of code
  ThemeData get themedata => _themeData;
  // getter method to see if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

// setter method to set new theme
  set themedata(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

// we will toggle this in a switch
  void toggleTheme() {
    if (_themeData == lightMode) {
      themedata = darkMode;
    } else {
      themedata = lightMode;
    }
  }
}
