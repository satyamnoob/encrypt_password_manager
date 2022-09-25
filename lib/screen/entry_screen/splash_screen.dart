import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:encrypt_password_manager/provider/first_time_opening_app_provider.dart';
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:encrypt_password_manager/provider/theme_provider.dart';
import 'package:encrypt_password_manager/screen/entry_screen/introductory_screen.dart';
import 'package:encrypt_password_manager/screen/home_screen/home_screen.dart';
import 'package:encrypt_password_manager/services/data_management.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _setUpApp() async {
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).intializeDarkMode();
    Provider.of<PasswordSettingsProvider>(
      context,
      listen: false,
    ).intializePasswordGeneratorSettings();
    Provider.of<MasterPasswordProvider>(
      context,
      listen: false,
    ).initializeFirstTimeOpeningApp();
  }

  @override
  void initState() {
    super.initState();
    _setUpApp();
  }

  @override
  Widget build(BuildContext context) {
    bool isMasterPasswordNotSet =
        Provider.of<MasterPasswordProvider>(context).masterpassword == null;
    print(isMasterPasswordNotSet);
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      duration: 2000,
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Encry',
            style: TextStyleCollection.headingTextStyle1,
          ),
          Text(
            'pt.',
            style: TextStyleCollection.headingTextStyle2,
          ),
        ],
      ),
      nextScreen: isMasterPasswordNotSet
          ? const IntroductoryScreen()
          : const HomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
