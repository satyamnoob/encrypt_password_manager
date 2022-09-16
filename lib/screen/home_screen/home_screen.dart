import 'package:encrypt_password_manager/model/password.dart';
import 'package:encrypt_password_manager/screen/home_screen/password_details_screen.dart';
import 'package:encrypt_password_manager/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/password_tile.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  final List<Password> passwords = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EncryptAppBar(isHomePage: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: passwords.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        PasswordDetailsScreen.routeName,
                        arguments: passwords[index],
                      );
                    },
                    child: PasswordTile(password: passwords[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
