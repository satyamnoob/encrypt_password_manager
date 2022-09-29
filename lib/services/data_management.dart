import 'package:encrypt_password_manager/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManagement {
  //First Time Opening App
  // static setIsFirstTime() async {
  //   final instance = await SharedPreferences.getInstance();
  //   await instance.setBool(Keys.firstTime, true);
  // }

  // static get isFirstTime async {
  //   final instance = await SharedPreferences.getInstance();
  //   final data = instance.getBool(Keys.firstTime);
  //   return data == null ? false : true;
  // }

  //DarkMode ---------------------->
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

  //Password Settings ------------->

  //Password Length
  static setPasswordLength(int value) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setInt(Keys.passwordLength, value);
  }

  static get passwordLength async {
    final instance = await SharedPreferences.getInstance();
    final data = instance.getInt(Keys.passwordLength);
    if (data == null) return 8;
    return data;
  }

  //Letters Allowed
  static setIsLettersAllowed(bool value) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(Keys.isLettersAllowed, value);
  }

  static get isLettersAllowed async {
    final instance = await SharedPreferences.getInstance();
    final data = instance.getBool(Keys.isLettersAllowed);
    if (data == null) return true;
    return data;
  }

  // Special Char Allowed
  static setIsSpecialCharactersAllowed(bool value) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(Keys.isSpecialCharectersAllowed, value);
  }

  static get isSpecialCharactersAllowed async {
    final instance = await SharedPreferences.getInstance();
    final data = instance.getBool(Keys.isSpecialCharectersAllowed);
    if (data == null) return true;
    return data;
  }

  //Numbers Allowed
  static setIsNumbersAllowed(bool value) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(Keys.isNumbersAllowed, value);
  }

  static get isNumbersAllowed async {
    final instance = await SharedPreferences.getInstance();
    final data = instance.getBool(Keys.isNumbersAllowed);
    if (data == null) return true;
    return data;
  }
}
