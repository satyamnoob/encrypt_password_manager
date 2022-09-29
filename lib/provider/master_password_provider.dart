import 'package:encrypt_password_manager/services/secure_management.dart';
import 'package:flutter/material.dart';

class MasterPasswordProvider extends ChangeNotifier {
  String? _masterPassword;
  bool _isMasterPasswordSet = false;

  setMasterPassword(BuildContext context, String value) async {
    await SecureManagement.setMasterPassword(
      context,
      value.trim(),
    );
    _masterPassword = await SecureManagement.masterPassword;
    if (_masterPassword != null) {
      _isMasterPasswordSet = true;
    }
    notifyListeners();
  }

  Future<bool> initializeMasterPassword() async {
    _masterPassword = await SecureManagement.masterPassword;
    print("Master Password = $_masterPassword");
    notifyListeners();
    return _masterPassword == null ? false : true;
  }

  String? get masterpassword => _masterPassword;

  bool get isMasterPasswordSet => _isMasterPasswordSet;
}
