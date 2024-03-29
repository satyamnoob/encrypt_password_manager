import 'package:encrypt_password_manager/constants/common_alert_dialogs.dart';
import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        CommonAlertDialogs.onPasswordDeletedDialog(
            context: context, id: password.id);
      },
      child: ListTile(
        leading: Icon(
          password.iconData ?? FontAwesomeIcons.lock,
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
      ),
    );
  }
}
