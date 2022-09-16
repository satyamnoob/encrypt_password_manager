import 'package:carbon_icons/carbon_icons.dart';
import 'package:encrypt_password_manager/screen/other_screen/add_new_password.dart';
import 'package:flutter/material.dart';

import '../constants/text_style_collections.dart';

class EncryptAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool isHomePage;
  bool isPasswordDetailsPage;
  bool isPasswordEditPage;
  String? url;
  EncryptAppBar({
    Key? key,
    this.isHomePage = false,
    this.isPasswordDetailsPage = false,
    this.isPasswordEditPage = false,
    this.url,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isHomePage
          ? Row(
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
            )
          : isPasswordDetailsPage
              ? Text(url!)
              : const Text('Edit Password'),
      leading: isHomePage
          ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_rounded),
            )
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CarbonIcons.arrow_left,
              ),
            ),
      actions: [
        if (isHomePage)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        if (!isHomePage)
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewPasswordScreen.routeName);
            },
            icon: const Icon(CarbonIcons.edit),
          ),
      ],
    );
  }
}
