import 'package:encrypt_password_manager/model/password.dart';
import 'package:flutter/foundation.dart';

class PasswordsProvider extends ChangeNotifier {
  final List<Password> _passwords = [
    Password(
      nameOrUrl: 'www.github.com',
      usernameOrEmail: 'satyam@gmail.com',
      password: "123456",
      notes:
          'This is my github password hsjsieikjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh.',
    ),
    Password(
      nameOrUrl: 'www.facebook.com',
      usernameOrEmail: 'satyam@gmail.com',
      password: "123456",
      notes: 'This is my facebook password.',
    ),
    Password(
      nameOrUrl: 'www.instagram.com',
      usernameOrEmail: 'satyamnoob',
      password: "123456",
    ),
    Password(
      nameOrUrl: 'www.twitter.com',
      usernameOrEmail: 'satyamnoob',
      password: "123456",
    ),
  ];

  List<Password> get passwords => _passwords;

  addPassword(Password newPassword) {
    _passwords.add(newPassword);
    notifyListeners();
  }

  deletePassword(String id) {
    _passwords.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  editPassword(String id, String nameOrUrl, String usernameOrEmail,
      String password, String? notes) {
    _passwords[_passwords.indexWhere((element) => element.id == id)] = Password(
      nameOrUrl: nameOrUrl,
      usernameOrEmail: usernameOrEmail,
      password: password,
      notes: notes,
    );
    notifyListeners();
  }
}
