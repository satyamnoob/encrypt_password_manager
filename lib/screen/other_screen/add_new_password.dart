import 'package:encrypt_password_manager/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AddNewPasswordScreen extends StatelessWidget {
  static const routeName = '/add-new-password';
  const AddNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EncryptAppBar(isPasswordEditPage: true),
    );
  }
}
