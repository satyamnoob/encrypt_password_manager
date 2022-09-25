import 'package:carbon_icons/carbon_icons.dart';
import 'package:encrypt_password_manager/constants/generated_password_settings.dart';
import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:encrypt_password_manager/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/size_config.dart';
import '../../constants/text_style_collections.dart';

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
    bool switchValue = Provider.of<ThemeProvider>(context).isDarkMode;
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
                _themeSettingsRow(switchValue),
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

  _themeSettingsRow(bool switchValue) {
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
                value: switchValue,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Letters',
                style: TextStyleCollection.passwordDetails,
              ),
              Switch(
                value: Provider.of<PasswordSettingsProvider>(context)
                    .isLettersAllowed,
                onChanged: (value) {
                  Provider.of<PasswordSettingsProvider>(
                    context,
                    listen: false,
                  ).setIsLettersAllowed(value);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Numbers',
                style: TextStyleCollection.passwordDetails,
              ),
              Switch(
                value: Provider.of<PasswordSettingsProvider>(context)
                    .isNumbersAllowed,
                onChanged: (value) {
                  Provider.of<PasswordSettingsProvider>(
                    context,
                    listen: false,
                  ).setIsNumbersAllowed(value);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Charecters',
                style: TextStyleCollection.passwordDetails,
              ),
              Switch(
                value: Provider.of<PasswordSettingsProvider>(context)
                    .isSpecialCharactersAllowed,
                onChanged: (value) {
                  Provider.of<PasswordSettingsProvider>(
                    context,
                    listen: false,
                  ).setIsSpecialCharactersAllowed(value);
                },
              ),
            ],
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
