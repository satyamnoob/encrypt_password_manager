import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:flutter/material.dart';

class Snackbar {
  static errorSnackbar(BuildContext context, String content) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          content,
          style: TextStyleCollection.errorSnackbar,
        ),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  static removeCurrentSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
