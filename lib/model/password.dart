import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Password {
  String id = _uiqueId();
  String nameOrUrl;
  String usernameOrEmail;
  String password;
  String? notes;

  Password({
    required this.nameOrUrl,
    required this.usernameOrEmail,
    required this.password,
    this.notes,
  });

  static String _uiqueId() {
    var uuid = const Uuid();
    return uuid.v1();
  }
}
