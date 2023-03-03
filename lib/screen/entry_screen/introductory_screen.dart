import 'package:encrypt_password_manager/constants/snackbar.dart';
// import 'package:encrypt_password_manager/provider/crypt_provider.dart';
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:encrypt_password_manager/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style_collections.dart';

class IntroductoryScreen extends StatefulWidget {
  const IntroductoryScreen({Key? key}) : super(key: key);

  @override
  State<IntroductoryScreen> createState() => _IntroductoryScreenState();
}

class _IntroductoryScreenState extends State<IntroductoryScreen> {
  final TextEditingController _masterPasswordController =
      TextEditingController();

  // void _initializeCryptSettings() async {
  //   await Provider.of<CryptProvider>(
  //     context,
  //     listen: false,
  //   ).generateCryptSettings();
  // }

  @override
  void initState() {
    super.initState();
    // _initializeCryptSettings();
  }

  int _validate = 9;

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> introPages = [
      PageViewModel(
        image: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Encry',
              style: TextStyleCollection.appbarTextStyle1.copyWith(
                fontSize: 30,
              ),
            ),
            Text(
              'pt.',
              style: TextStyleCollection.appbarTextStyle2.copyWith(
                fontSize: 30,
              ),
            ),
          ],
        ),
        title: 'Password Manager',
        body: "Welcome to Encrypt.",
      ),
      PageViewModel(
        image: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Encry',
              style: TextStyleCollection.appbarTextStyle1.copyWith(
                fontSize: 30,
              ),
            ),
            Text(
              'pt.',
              style: TextStyleCollection.appbarTextStyle2.copyWith(
                fontSize: 30,
              ),
            ),
          ],
        ),
        title: 'Password Manager',
        body:
            "Encrypt is an opensource password manager made to protect your passwords using Hashing.",
      ),
      PageViewModel(
        image: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Encry',
              style: TextStyleCollection.appbarTextStyle1.copyWith(
                fontSize: 30,
              ),
            ),
            Text(
              'pt.',
              style: TextStyleCollection.appbarTextStyle2.copyWith(
                fontSize: 30,
              ),
            ),
          ],
        ),
        title: 'Set Master Password',
        bodyWidget: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setMasterPasswordtextField(),
          ],
        ),
      ),
    ];
    return Scaffold(
      body: IntroductionScreen(
        pages: introPages,
        showNextButton: false,
        showSkipButton: true,
        skip: const Text('Skip'),
        done: const Text("Set", style: TextStyle(fontWeight: FontWeight.w600)),
        // onChange: (_) {
        //   print(Provider.of<CryptProvider>(
        //     context,
        //     listen: false,
        //   ).salt);
        //   print(Provider.of<CryptProvider>(
        //     context,
        //     listen: false,
        //   ).rounds.toString());
        // },
        onDone: () async {
          // When done button is press
          if (_masterPasswordController.text.trim().length < 8) {
            Snackbar.errorSnackbar(
              context,
              'Cannot proceed before setting master password',
            );
          } else {
            await Provider.of<MasterPasswordProvider>(
              context,
              listen: false,
            ).setMasterPassword(context, _masterPasswordController.text);
            if (mounted) {
              Navigator.pushNamed(context, HomeScreen.routeName);
            }
          }
        },
      ),
    );
  }

  _setMasterPasswordtextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'atleat 8 characters long',
        errorText: _validate == 0
            ? 'Password Can\'t Be Empty'
            : _validate <= 8
                ? 'Password should be atleast 8 characters'
                : null,
      ),
      style: TextStyleCollection.passwordDetails,
      controller: _masterPasswordController,
      onChanged: (value) {
        if (value.isEmpty) {
          setState(() {
            _validate = 0;
          });
        } else if (value.trim().length >= 8) {
          setState(() {
            _validate = 9;
          });
        } else {
          setState(() {
            _validate = 5;
          });
        }
      },
    );
  }
}
