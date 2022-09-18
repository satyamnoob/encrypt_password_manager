import 'package:encrypt_password_manager/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManagement {
  //DarkMode
  static toggleDarkMode(bool value) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(Keys.darkMode, value);
  }

  static isDarkMode() async {
    final instance = await SharedPreferences.getInstance();
    final data = instance.getBool(Keys.darkMode);
    if (data == null) return false;
    return data;
  }
}
