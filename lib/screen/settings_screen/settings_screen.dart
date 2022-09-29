import 'package:carbon_icons/carbon_icons.dart';
import 'package:encrypt_password_manager/constants/generated_password_settings.dart';
import 'package:encrypt_password_manager/constants/types.dart';
import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:encrypt_password_manager/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/size_config.dart';
import '../../constants/text_style_collections.dart';
import '../../widgets/password_settings_switch.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Settin',
              style: TextStyleCollection.appbarTextStyle1,
            ),
            Text(
              'gs',
              style: TextStyleCollection.appbarTextStyle2,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CarbonIcons.arrow_left,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _themeSettingsRow(),
                const Divider(),
                _passwordSettingsRow(),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _themeSettingsRow() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: const Text('Theme'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: TextStyleCollection.passwordDetails,
              ),
              Switch(
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) async {
                  Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).toggleDarkMode(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _passwordSettingsRow() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(
          'Password Generator Settings',
          style: TextStyleCollection.passwordDetails,
        ),
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
                value: Provider.of<PasswordSettingsProvider>(context)
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
    );
  }
}
