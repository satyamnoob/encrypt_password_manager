import 'package:encrypt_password_manager/constants/colors.dart';
import 'package:flutter/material.dart';

class TextStyleCollection {
  //Heading TextStyle
  static const double headngFontSize = 40;
  static const headingFontFamily = 'Oswald';
  static TextStyle headingTextStyle1 = const TextStyle(
    fontSize: headngFontSize,
    color: AppColors.pureWhiteColor,
    // fontFamily: headingFontFamily,
  );
  static TextStyle headingTextStyle2 = const TextStyle(
    fontSize: headngFontSize,
    fontWeight: FontWeight.bold,
    color: Colors.cyanAccent,
    // fontFamily: headingFontFamily,
  );

  //Appbar TextStyle
  static TextStyle appbarTextStyle1 = const TextStyle();
  static TextStyle appbarTextStyle2 = const TextStyle(
    color: Colors.cyanAccent,
  );

  //PasswordTile TextStyle
  static TextStyle passwordTileTitle = const TextStyle(
    fontSize: 18,
  );
  static TextStyle passwordTileSubTitle = const TextStyle(
    fontSize: 13,
    color: Colors.cyan,
  );

  //PasswordDetails TextStyle
  static TextStyle passwordDetailsHeading = const TextStyle(
    fontSize: 18,
    color: Colors.cyan,
  );
  static TextStyle passwordDetails = const TextStyle(
    fontSize: 16,
  );

  //Elevated Button
  static TextStyle elevatedButton = const TextStyle(
    color: Colors.white,
  );

  //Error Snackbar Text Style
  static TextStyle errorSnackbar = const TextStyle(
    color: AppColors.pureWhiteColor,
  );

  //Alert Dialog Text Style
  static TextStyle deleteDialogButtonTextStyle = const TextStyle(
    color: AppColors.errorColor,
  );
}
