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

  addPassword({
    required String nameOrUrl,
    required String usernameOrEmail,
    required String password,
    String? notes,
  }) {
    Password newPassword = Password(
      nameOrUrl: nameOrUrl,
      usernameOrEmail: usernameOrEmail,
      password: password,
      notes: notes,
    );
    _passwords.add(newPassword);
    notifyListeners();
  }

  deletePassword(String id) {
    _passwords.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  editPassword({
    required String id,
    required String nameOrUrl,
    required String usernameOrEmail,
    required String password,
    String? notes,
  }) {
    final indexOfOldPassword =
        _passwords.indexWhere((element) => element.id == id);
    print("$nameOrUrl\n$usernameOrEmail\n$password\n${notes ?? ''}\n");
    _passwords[indexOfOldPassword].nameOrUrl = nameOrUrl;
    _passwords[indexOfOldPassword].usernameOrEmail = usernameOrEmail;
    _passwords[indexOfOldPassword].password = password;
    _passwords[indexOfOldPassword].notes = notes;
    print(
        "${_passwords[indexOfOldPassword].nameOrUrl}\n${_passwords[indexOfOldPassword].usernameOrEmail}\n${_passwords[indexOfOldPassword].password}\n${_passwords[indexOfOldPassword].notes ?? ''}\n");
    notifyListeners();
  }
}
