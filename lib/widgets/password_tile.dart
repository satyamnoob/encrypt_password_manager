import 'package:carbon_icons/carbon_icons.dart';
import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import '../model/password.dart';

class PasswordTile extends StatelessWidget {
  const PasswordTile({
    Key? key,
    required this.password,
  }) : super(key: key);

  final Password password;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        CarbonIcons.logo_facebook,
        size: Sizes.websiteIconSize,
      ),
      title: Text(
        password.nameOrUrl,
        style: TextStyleCollection.passwordTileTitle,
      ),
      subtitle: Text(
        password.usernameOrEmail,
        style: TextStyleCollection.passwordTileSubTitle,
      ),
    );
  }
}
