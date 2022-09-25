import 'package:flutter/foundation.dart';

import '../services/data_management.dart';

class MasterPasswordProvider extends ChangeNotifier {
  String? _masterPassword;

  setMasterPassword(String value) async {
    await DataManagement.setMasterPassword(
      value: value.trim(),
    );
    _masterPassword = await DataManagement.masterPassword;
    notifyListeners();
  }

  initializeFirstTimeOpeningApp() async {
    _masterPassword = await DataManagement.masterPassword;
    notifyListeners();
  }

  String? get masterpassword => _masterPassword;
}
