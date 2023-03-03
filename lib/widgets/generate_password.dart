import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:encrypt_password_manager/provider/theme_provider.dart';
import 'package:encrypt_password_manager/widgets/password_settings_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/generated_password_settings.dart';
import '../constants/snackbar.dart';
import '../constants/text_style_collections.dart';
import '../constants/types.dart';

class GeneratePassword extends StatelessWidget {
  const GeneratePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool allSettingsDisabled =
        Provider.of<PasswordSettingsProvider>(context).allSettingsDisabled;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
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
          ),
          InkWell(
            onTap: () => _showModalBottomSheet(context),
            child: const Icon(
              Icons.settings_applications,
              color: AppColors.primaryThemeColor,
            ),
          ),
        ],
      ),
    );
  }

  _showModalBottomSheet(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).isDarkMode;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: isDark ? AppColors.pureBlackColor : AppColors.pureWhiteColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const PasswordSettingsSwitch(
                        switchType: PasswordSettingsSwitchType.letter,
                      ),
                      const PasswordSettingsSwitch(
                        switchType: PasswordSettingsSwitchType.number,
                      ),
                      const PasswordSettingsSwitch(
                        switchType: PasswordSettingsSwitchType.specialCharacter,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Password Length',
                            style: TextStyleCollection.passwordDetails,
                          ),
                          DropdownButton(
                            // isExpanded: true,
                            value:
                                Provider.of<PasswordSettingsProvider>(context)
                                    .passwordLength,
                            // hint: const Text('Select Length'),
                            items: GeneratedPasswordLengthValues.lengthValues
                                .map(
                                  (int item) => DropdownMenuItem<int>(
                                    value: item,
                                    child: SizedBox(
                                      // width: SizeConfig.safeBlockHorizontal! * 8,
                                      child: Text(
                                        item.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (int? value) {
                              Provider.of<PasswordSettingsProvider>(
                                context,
                                listen: false,
                              ).setPasswordLength(value!);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
