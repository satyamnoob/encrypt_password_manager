import 'package:encrypt/encrypt.dart';
import 'package:encrypt_password_manager/constants/crypt_hashing_function.dart';
import 'package:encrypt_password_manager/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureManagement {
  //Master Password---------->

  //AndroidOptions
  static AndroidOptions _secureOption() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  //Set Master Password
  static setMasterPassword(BuildContext context, String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(
      key: Keys.masterPassword,
      value: generateMasterPasswordHash(
        context: context,
        value: value,
      ),
      aOptions: _secureOption(),
    );
  }

  //Get Master Password
  static get masterPassword async {
    const storage = FlutterSecureStorage();
    final data = await storage.read(
      key: Keys.masterPassword,
      aOptions: _secureOption(),
    );
    if (data == null) {
      return null;
    }
    return data;
  }

  //Store encrypted passwords
  static saveEncryptedPassword({
    required String key,
    required Encrypted password,
  }) async {
    const storage = FlutterSecureStorage();
    await storage.write(
      key: key,
      value: password.base64,
      aOptions: _secureOption(),
    );
  }
}

class CryptSecure {
  //AndroidOptions
  static AndroidOptions _secureOption() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  //Salt And Rounds For Crypt -------------->

  //Set salt
  static setRandomSalt(String salt) async {
    const storage = FlutterSecureStorage();
    await storage.write(
      key: Keys.saltMasterPassword,
      value: salt,
      aOptions: _secureOption(),
    );
  }

  //Get Salt
  static get salt async {
    const storage = FlutterSecureStorage();
    final data = await storage.read(
      key: Keys.saltMasterPassword,
      aOptions: _secureOption(),
    );
    return data;
  }

  //Set Rounds
  static setRounds(int rounds) async {
    const storage = FlutterSecureStorage();
    await storage.write(
      key: Keys.roundsMasterPassword,
      value: rounds.toString(),
      aOptions: _secureOption(),
    );
  }

  //Get Rounds
  static get rounds async {
    const storage = FlutterSecureStorage();
    final data = await storage.read(
      key: Keys.roundsMasterPassword,
      aOptions: _secureOption(),
    );
    if (data == null) {
      return null;
    }
    return int.parse(data);
  }
}
