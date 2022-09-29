import 'package:encrypt_password_manager/constants/generate_functions.dart';
import 'package:encrypt_password_manager/services/secure_management.dart';
import 'package:flutter/foundation.dart';

class CryptProvider extends ChangeNotifier {
  String? _salt;
  int? _rounds;

  intializeCryptSettings() async {
    print("Getting Crypt Settings");
    _salt = await CryptSecure.salt;
    _rounds = await CryptSecure.rounds;
    print("$_salt $rounds");
    notifyListeners();
  }

  generateCryptSettings() async {
    print("Generate Crypt Settings");
    String generatedSalt = generateStrongPassword(lengthOfPassword: 20);
    int generatedRounds = generateRandomRoundsForCrypt();
    await CryptSecure.setRandomSalt(generatedSalt);
    await CryptSecure.setRounds(generatedRounds);
    _salt = await CryptSecure.salt;
    _rounds = await CryptSecure.rounds;
    print("$generatedSalt $generatedRounds");
    print("Salt = $_salt Rounds = $_rounds");
    notifyListeners();
  }

  String? get salt => _salt;
  int? get rounds => _rounds;
}
