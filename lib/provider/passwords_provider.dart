import 'package:encrypt_password_manager/constants/crypt_hashing_function.dart';
import 'package:encrypt_password_manager/constants/generate_functions.dart';
import 'package:encrypt_password_manager/constants/icon_map.dart';
import 'package:encrypt_password_manager/model/password.dart';
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:encrypt_password_manager/services/encrypt_management.dart';
import 'package:encrypt_password_manager/services/secure_management.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PasswordsProvider extends ChangeNotifier {
  final Map<String, Password> _passwords = {
    // 'hdbff35': Password(
    //   nameOrUrl: 'www.github.com',
    //   usernameOrEmail: 'satyam@gmail.com',
    //   password: "123456",
    //   notes:
    //       'This is my github password hsjsieikjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh.',
    //   iconData: IconMap.iconMap['github'],
    // ),
    // '13hdbaa': Password(
    //   nameOrUrl: 'www.facebook.com',
    //   usernameOrEmail: 'satyam@gmail.com',
    //   password: "123456",
    //   notes: 'This is my facebook password.',
    //   iconData: IconMap.iconMap['facebook'],
    // ),
    // '00eidj': Password(
    //   nameOrUrl: 'www.instagram.com',
    //   usernameOrEmail: 'satyamnoob',
    //   password: "123456",
    //   iconData: IconMap.iconMap['instagram'],
    // ),
    // '0sahnv': Password(
    //   nameOrUrl: 'www.twitter.com',
    //   usernameOrEmail: 'satyamnoob',
    //   password: "123456",
    //   iconData: IconMap.iconMap['twitter'],
    // ),
  };

  Map<String, Password> get passwords => _passwords;

  addPassword({
    required BuildContext context,
    required String nameOrUrl,
    required String usernameOrEmail,
    required String password,
    String? notes,
  }) async {
    Password newPassword = Password(
      nameOrUrl: nameOrUrl,
      usernameOrEmail: usernameOrEmail,
      password: EncryptManagement.encryptAES(
        context: context,
        password: password,
        index: _passwords.length,
      ),
      notes: notes,
      index: _passwords.length,
    );
    IconData? iconData = getIconData(nameOrUrl);
    newPassword.iconData = iconData;
    _passwords[newPassword.id] = newPassword;
    print(newPassword.index);
    notifyListeners();
  }

  deletePassword(String id) {
    print("Here");
    if (_passwords.containsKey(id)) {
      _passwords.remove(id);
      print(_passwords.toString());
      notifyListeners();
    }
  }

  editPassword({
    required String id,
    required String nameOrUrl,
    required String usernameOrEmail,
    required String password,
    String? notes,
  }) {
    _passwords[id]!.nameOrUrl = nameOrUrl;
    _passwords[id]!.usernameOrEmail = usernameOrEmail;
    _passwords[id]!.password = password;
    _passwords[id]!.notes = notes;
    notifyListeners();
  }

  IconData? getIconData(String nameOrUrl) {
    nameOrUrl = nameOrUrl.toLowerCase();
    if (!nameOrUrl.startsWith('https://')) {
      nameOrUrl = 'https://$nameOrUrl';
    }
    if (!nameOrUrl.endsWith('/')) {
      nameOrUrl = '$nameOrUrl/';
    }
    final uri = Uri.parse(nameOrUrl);
    final host = uri.host;
    final domain = host.split('.')[1];
    // print(domain);
    return IconMap.iconMap[domain] ?? FontAwesomeIcons.lock;
  }
}
