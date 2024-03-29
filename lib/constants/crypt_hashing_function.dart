import 'package:crypt/crypt.dart';
import 'package:encrypt_password_manager/provider/crypt_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String generateMasterPasswordHash({
  required BuildContext context,
  required String value,
}) {
  String salt = Provider.of<CryptProvider>(
    context,
    listen: false,
  ).salt!;
  int rounds = Provider.of<CryptProvider>(
    context,
    listen: false,
  ).rounds!;
  final passwordHash = Crypt.sha256(value, rounds: rounds, salt: salt);
  // print(passwordHash);
  return passwordHash.toString();
}

// String generateStoredPasswordHash({
//   required String value,
//   required int rounds,
//   required String salt,
// }) {
//   final passwordHash = Crypt.sha256(value, rounds: rounds, salt: salt);
//   return passwordHash.toString();
// }
