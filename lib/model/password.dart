import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Password {
  String id = _uiqueId();
  String nameOrUrl;
  String usernameOrEmail;
  String password;
  int index;
  // int rounds;
  // String salt;
  String? notes;
  IconData? iconData;

  Password({
    required this.nameOrUrl,
    required this.usernameOrEmail,
    required this.password,
    required this.index,
    // required this.rounds,
    // required this.salt,
    this.notes,
    this.iconData,
  });

  static String _uiqueId() {
    var uuid = const Uuid();
    return uuid.v1();
  }
}
