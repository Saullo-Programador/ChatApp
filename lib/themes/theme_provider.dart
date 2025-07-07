import 'package:flutter/material.dart';
import 'package:flutter_app/themes/dark_mode.dart';
import 'package:flutter_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == darkMode){
      themeData = lightMode;
    }else{
      themeData = darkMode;
    }
  }
}
