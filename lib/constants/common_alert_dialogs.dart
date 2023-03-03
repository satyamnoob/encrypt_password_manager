import 'package:encrypt_password_manager/constants/snackbar.dart';
import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:encrypt_password_manager/services/encrypt_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/password.dart';

class CommonAlertDialogs {
  static onPasswordDeletedDialog(
      {required BuildContext context, required String id}) {
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Delete Confirmation"),
      content: const Text("Are you sure you want to delete this password?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Provider.of<PasswordsProvider>(
              context,
              listen: false,
            ).deletePassword(id);
            Navigator.of(context).pop();
            Snackbar.confirmationSnackbar(context, "Password deleted");
          },
          child: Text(
            "Delete",
            style: TextStyleCollection.deleteDialogButtonTextStyle,
          ),
        )
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  static Future<String> decryptPasswordDialog(
      {required BuildContext context,
      required String id,
      required TextEditingController masterPasswordController}) async {
    String decryptedPassword = '';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Master Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "To decrypt the password enter your master password:",
                style: TextStyle(fontFamily: 'Subtitle'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  maxLength: 32,
                  decoration: InputDecoration(
                      hintText: "Master Pass",
                      hintStyle: const TextStyle(fontFamily: "Subtitle"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  controller: masterPasswordController,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                Password password = Provider.of<PasswordsProvider>(
                  context,
                  listen: false,
                ).passwords[id]!;
                decryptedPassword = await EncryptManagement.decryptAES(
                  context: context,
                  index: password.index,
                );
              },
              child: const Text("DONE"),
            )
          ],
        );
      },
    );
    return decryptedPassword;
  }
}
