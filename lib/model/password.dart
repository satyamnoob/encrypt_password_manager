import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Password {
  String id = _uiqueId();
  String nameOrUrl;
  String usernameOrEmail;
  String password;
  String? notes;
  IconData? iconData;

  Password({
    required this.nameOrUrl,
    required this.usernameOrEmail,
    required this.password,
    this.notes,
    this.iconData,
  });

  static String _uiqueId() {
    var uuid = const Uuid();
    return uuid.v1();
  }
}
