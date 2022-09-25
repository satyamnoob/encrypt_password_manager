import 'package:encrypt_password_manager/constants/generate_strong_password.dart';
import 'package:flutter/foundation.dart';

import '../services/data_management.dart';

class PasswordSettingsProvider extends ChangeNotifier {
  String _password = '';
  int _lengthOfPassword = 8;
  bool _isLetter = true;
  bool _isNumber = true;
  bool _isSpecial = true;

  intializePasswordGeneratorSettings() async {
    _lengthOfPassword = await DataManagement.passwordLength;
    _isLetter = await DataManagement.isLettersAllowed;
    _isNumber = await DataManagement.isNumbersAllowed;
    _isSpecial = await DataManagement.isSpecialCharactersAllowed;
    notifyListeners();
  }

  setIsLettersAllowed(bool value) async {
    _isLetter = value;
    await DataManagement.setIsLettersAllowed(value);
    notifyListeners();
  }

  bool get isLettersAllowed => _isLetter;

  setIsNumbersAllowed(bool value) async {
    _isNumber = value;
    await DataManagement.setIsNumbersAllowed(value);
    notifyListeners();
  }

  bool get isNumbersAllowed => _isNumber;

  setIsSpecialCharactersAllowed(bool value) async {
    _isSpecial = value;
    await DataManagement.setIsSpecialCharactersAllowed(value);
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
    _password = generateStrongPassword(
      lengthOfPassword: _lengthOfPassword,
      isNumber: _isNumber,
      letter: _isLetter,
      isSpecial: _isSpecial,
    );
    notifyListeners();
  }

  deleteGeneratedPassword() {
    _password = '';
    notifyListeners();
  }

  String get password => _password;
}
