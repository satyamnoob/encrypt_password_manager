import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:encrypt_password_manager/provider/crypt_provider.dart';
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:encrypt_password_manager/provider/theme_provider.dart';
import 'package:encrypt_password_manager/screen/entry_screen/introductory_screen.dart';
import 'package:encrypt_password_manager/screen/home_screen/home_screen.dart';
// import 'package:encrypt_password_manager/services/secure_management.dart';
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
  late bool _isMasterPasswordSet = false;

  void _initializeIsDarkMode() {
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).intializeDarkMode();
  }

  void _initializePasswordGeneratorSettings() {
    Provider.of<PasswordSettingsProvider>(
      context,
      listen: false,
    ).intializePasswordGeneratorSettings();
  }

  Future<bool> _initializeMaterPassword() async {
    _isMasterPasswordSet = await Provider.of<MasterPasswordProvider>(
      context,
      listen: false,
    ).initializeMasterPassword();
    return _isMasterPasswordSet;
  }

  _initializeCrypt({bool firstTime = true}) {
    if (firstTime) {
      Provider.of<CryptProvider>(
        context,
        listen: false,
      ).generateCryptSettings();
    } else {
      Provider.of<CryptProvider>(
        context,
        listen: false,
      ).intializeCryptSettings();
    }
  }

  _setUpApp() async {
    _initializeIsDarkMode();
    _initializePasswordGeneratorSettings();
    // _initializeMaterPassword().then((_) {
    //   print(_isMasterPasswordSet);
    //   _initializeCrypt();
    // });
  }

  @override
  void initState() {
    super.initState();
    _setUpApp();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeMaterPassword(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            _initializeCrypt(firstTime: false);
          } else {
            _initializeCrypt();
          }
          return AnimatedSplashScreen(
            backgroundColor: Colors.black,
            duration: 5000,
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
            nextScreen: snapshot.hasData && snapshot.data == true
                ? const HomeScreen()
                : const IntroductoryScreen(),
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.rightToLeft,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
