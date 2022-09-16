import 'package:encrypt_password_manager/constants/colors.dart';
import 'package:encrypt_password_manager/constants/sized_box.dart';
import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:encrypt_password_manager/model/password.dart';
import 'package:encrypt_password_manager/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordDetailsScreen extends StatelessWidget {
  static const routeName = '/password-details';
  const PasswordDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final password = ModalRoute.of(context)!.settings.arguments as Password;
    return Scaffold(
      appBar: EncryptAppBar(
        isPasswordDetailsPage: true,
        url: password.nameOrUrl,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._passwordField(
                    context, 'NAME/URL', password.nameOrUrl, false),
                SizedBoxes.sizedBox10,
                ..._passwordField(
                    context, 'USERNAME/EMAIL', password.usernameOrEmail, true),
                SizedBoxes.sizedBox10,
                ..._passwordField(context, 'PASSWORD', password.password, true),
                SizedBoxes.sizedBox10,
                ..._passwordField(context, 'NOTES',
                    password.notes ?? 'No Notes Added', false),
                SizedBoxes.sizedBox10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  _passwordField(BuildContext context, String fieldName, String fieldValue,
      bool isEmailOrPassword) {
    SnackBar snackBar =
        SnackBar(content: Text('$fieldName copied to clipboard'));
    return [
      Text(
        fieldName,
        style: TextStyleCollection.passwordDetailsHeading,
      ),
      if (!isEmailOrPassword)
        Text(
          fieldValue,
          style: TextStyleCollection.passwordDetails,
        ),
      if (isEmailOrPassword)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fieldValue,
              style: TextStyleCollection.passwordDetails,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.buttonColor),
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: fieldValue)).then(
                  (value) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              },
              child: FittedBox(
                child: Text(
                  'Copy',
                  style: TextStyleCollection.elevatedButton,
                ),
              ),
            ),
          ],
        ),
    ];
  }
}
