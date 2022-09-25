import 'package:flutter/material.dart';

class Snackbar {
  static errorSnackbar(BuildContext context, String content) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(content),
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  static removeCurrentSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
