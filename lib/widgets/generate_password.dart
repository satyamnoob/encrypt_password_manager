import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneratePassword extends StatelessWidget {
  const GeneratePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Provider.of<PasswordSettingsProvider>(
            context,
            listen: false,
          ).generatePassword();
        },
        child: const Text('Generate A Strong Password'),
      ),
    );
  }
}
