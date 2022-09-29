import 'package:encrypt_password_manager/services/data_management.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  // ThemeData _lightTheme = ThemeData();
  // ThemeData _darkTheme = ThemeData();

  toggleDarkMode(bool value) async {
    await DataManagement.toggleDarkMode(value);
    _isDark = !_isDark;
    print("IS DARK ------>" + _isDark.toString());
    notifyListeners();
  }

  // setThemeData({required ThemeData lightTheme, required ThemeData darkTheme}) {
  //   _lightTheme = lightTheme;
  //   _darkTheme = darkTheme;
  //   notifyListeners();
  // }

  intializeDarkMode() async {
    _isDark = await DataManagement.isDarkMode();
    notifyListeners();
  }

  bool get isDarkMode => _isDark;

  // ThemeData get getLightTheme => _lightTheme;

  // ThemeData get getDarkTheme => _darkTheme;
}
