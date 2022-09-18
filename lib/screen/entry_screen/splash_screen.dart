import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:encrypt_password_manager/constants/text_style_collections.dart';
import 'package:encrypt_password_manager/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
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
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
