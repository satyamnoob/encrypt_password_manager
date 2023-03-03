import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EncryptManagement {
//for Fernet Algorithms

  static encrypt.Encrypted? encrypted;
  static String? decrypted;

  static encryptAES({
    required BuildContext context,
    required String password,
    required int index,
  }) {
    final key = encrypt.Key.fromUtf8(
      Provider.of<MasterPasswordProvider>(
            context,
            listen: false,
          ).masterpassword!.substring(45) +
          index.toString(),
    );
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    encrypted = encrypter.encrypt(password, iv: iv);
    print(encrypted!.base64);
    return encrypted!.base64;
  }

  static Future<String> decryptAES(
      {required BuildContext context, required int index}) async {
    final key = encrypt.Key.fromUtf8(Provider.of<MasterPasswordProvider>(
          context,
          listen: false,
        ).masterpassword!.substring(45) +
        index.toString());
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    print(decrypted);
    return decrypted.toString();
  }
}
