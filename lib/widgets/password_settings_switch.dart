import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/text_style_collections.dart';
import '../constants/types.dart';
import '../provider/password_settings_provider.dart';

class PasswordSettingsSwitch extends StatelessWidget {
  const PasswordSettingsSwitch({
    Key? key,
    // required this.context,
    // required this.title,
    required this.switchType,
  }) : super(key: key);

  // final BuildContext context;
  // final String title;
  final PasswordSettingsSwitchType switchType;

  @override
  Widget build(BuildContext context) {
    final switchValue = _getSwitchValue(context: context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyleCollection.passwordDetails,
        ),
        Switch(
          value: switchValue,
          onChanged: (value) {
            if (switchType == PasswordSettingsSwitchType.letter) {
              Provider.of<PasswordSettingsProvider>(
                context,
                listen: false,
              ).setIsLettersAllowed(value);
            } else if (switchType == PasswordSettingsSwitchType.number) {
              Provider.of<PasswordSettingsProvider>(
                context,
                listen: false,
              ).setIsNumbersAllowed(value);
            } else {
              Provider.of<PasswordSettingsProvider>(
                context,
                listen: false,
              ).setIsSpecialCharactersAllowed(value);
            }
          },
        ),
      ],
    );
  }

  _getSwitchValue({required BuildContext context}) {
    if (switchType == PasswordSettingsSwitchType.letter) {
      return Provider.of<PasswordSettingsProvider>(context).isLettersAllowed;
    } else if (switchType == PasswordSettingsSwitchType.number) {
      return Provider.of<PasswordSettingsProvider>(context).isNumbersAllowed;
    } else {
      return Provider.of<PasswordSettingsProvider>(context)
          .isSpecialCharactersAllowed;
    }
  }

  get title {
    if (switchType == PasswordSettingsSwitchType.letter) {
      return 'Letters';
    } else if (switchType == PasswordSettingsSwitchType.number) {
      return 'Numbers';
    } else {
      return 'Special Characters';
    }
  }
}
