import 'package:encrypt_password_manager/model/password.dart';
import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:encrypt_password_manager/screen/home_screen/password_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style_collections.dart';
import '../../widgets/password_tile.dart';
import '../other_screen/add_new_password.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Password> passwords =
        Provider.of<PasswordsProvider>(context).passwords;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Encry',
              style: TextStyleCollection.appbarTextStyle1,
            ),
            Text(
              'pt.',
              style: TextStyleCollection.appbarTextStyle2,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewPasswordScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
