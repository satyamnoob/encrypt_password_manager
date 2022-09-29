import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/snackbar.dart';

class GeneratePassword extends StatelessWidget {
  const GeneratePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool allSettingsDisabled =
        Provider.of<PasswordSettingsProvider>(context).allSettingsDisabled;
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          if (allSettingsDisabled) {
            Snackbar.errorSnackbar(context,
                'You need to enable atleast one of the three Password Generator Settings');
            return;
          }
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
