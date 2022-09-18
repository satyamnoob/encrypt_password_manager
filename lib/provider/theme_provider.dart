import 'package:encrypt_password_manager/services/data_management.dart';
import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  toggleDarkMode(bool value) async {
    await DataManagement.toggleDarkMode(value);
    _isDark = !_isDark;
    notifyListeners();
  }

  bool get isDarkMode => _isDark;

  intializeDarkMode() async {
    _isDark = await DataManagement.isDarkMode();
    notifyListeners();
  }
}
