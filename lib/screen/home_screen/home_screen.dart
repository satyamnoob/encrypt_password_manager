import 'package:encrypt_password_manager/model/password.dart';
import 'package:encrypt_password_manager/provider/crypt_provider.dart';
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:encrypt_password_manager/screen/home_screen/password_details_screen.dart';
import 'package:encrypt_password_manager/screen/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style_collections.dart';
import '../../widgets/password_tile.dart';
import '../add_edit_password_screen/add_new_password.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // initAsync();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Password> passwords =
        Provider.of<PasswordsProvider>(context).passwords;
    print(
        "Master Password Hash ------------->${Provider.of<MasterPasswordProvider>(context).masterpassword}");
    print(
        "Salt and rounds --------------------->${Provider.of<CryptProvider>(context).salt} ${Provider.of<CryptProvider>(context).rounds}");
    var passwordKeys = passwords.keys.toList();
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
          onPressed: () {
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          },
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
        child: passwords.isEmpty
            ? const Center(
                child: Text('No passwords added.'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: passwords.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PasswordDetailsScreen.routeName,
                              arguments: passwords[passwordKeys[index]]!,
                            );
                          },
                          child: PasswordTile(
                              password: passwords[passwordKeys[index]]!),
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
