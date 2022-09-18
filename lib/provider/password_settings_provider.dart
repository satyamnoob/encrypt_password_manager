import 'package:encrypt_password_manager/constants/generate_strong_password.dart';
import 'package:flutter/foundation.dart';

class PasswordSettingsProvider extends ChangeNotifier {
  String _password = '';
  int lengthOfPassword = 8;
  bool letter = true;
  bool isNumber = true;
  bool isSpecial = true;

  generatePassword() {
    _password = generateStrongPassword(
      lengthOfPassword: lengthOfPassword,
      isNumber: isNumber,
      letter: letter,
      isSpecial: isSpecial,
    );
    notifyListeners();
  }

  deleteGeneratedPassword() {
    _password = '';
    notifyListeners();
  }

  String get password => _password;
}
