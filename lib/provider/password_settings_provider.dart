import 'package:encrypt_password_manager/constants/generate_functions.dart';
import 'package:flutter/foundation.dart';

import '../services/data_management.dart';

class PasswordSettingsProvider extends ChangeNotifier {
  String _password = '';
  int _lengthOfPassword = 8;
  bool _isLetter = true;
  bool _isNumber = true;
  bool _isSpecial = true;
  bool _allSettingsDisabled = false;

  _checkAllSettingsDisabled() {
    return !_isLetter && !_isNumber && !_isSpecial;
  }

  intializePasswordGeneratorSettings() async {
    _lengthOfPassword = await DataManagement.passwordLength;
    _isLetter = await DataManagement.isLettersAllowed;
    _isNumber = await DataManagement.isNumbersAllowed;
    _isSpecial = await DataManagement.isSpecialCharactersAllowed;
    _allSettingsDisabled = _checkAllSettingsDisabled();
    print(
        "Length = $_lengthOfPassword\nIs Letter = $_isLetter\nIs Number = $_isNumber\nIs Special = $_isSpecial");
    notifyListeners();
  }

  setIsLettersAllowed(bool value) async {
    _isLetter = value;
    await DataManagement.setIsLettersAllowed(value);
    _allSettingsDisabled = _checkAllSettingsDisabled();
    notifyListeners();
  }

  bool get isLettersAllowed => _isLetter;

  setIsNumbersAllowed(bool value) async {
    _isNumber = value;
    await DataManagement.setIsNumbersAllowed(value);
    _allSettingsDisabled = _checkAllSettingsDisabled();
    notifyListeners();
  }

  bool get isNumbersAllowed => _isNumber;

  setIsSpecialCharactersAllowed(bool value) async {
    _isSpecial = value;
    await DataManagement.setIsSpecialCharactersAllowed(value);
    _allSettingsDisabled = _checkAllSettingsDisabled();
    notifyListeners();
  }

  bool get isSpecialCharactersAllowed => _isSpecial;

  setPasswordLength(int length) async {
    _lengthOfPassword = length;
    await DataManagement.setPasswordLength(length);
    // print(await DataManagement.passwordLength);
    notifyListeners();
  }

  int get passwordLength => _lengthOfPassword;

  generatePassword() {
    if (_checkAllSettingsDisabled()) {
      return;
    }
    _password = generateStrongPassword(
      lengthOfPassword: _lengthOfPassword,
      isNumber: _isNumber,
      isLetter: _isLetter,
      isSpecial: _isSpecial,
    );
    notifyListeners();
  }

  deleteGeneratedPassword() {
    _password = '';
    notifyListeners();
  }

  String get password => _password;

  bool get allSettingsDisabled => _allSettingsDisabled;
}
