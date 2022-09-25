import 'dart:convert';

import 'package:encrypt_password_manager/provider/collection/provider_collections.dart';
import 'package:encrypt_password_manager/provider/theme_provider.dart';
import 'package:encrypt_password_manager/screen/home_screen/home_screen.dart';
import 'package:encrypt_password_manager/screen/home_screen/password_details_screen.dart';
import 'package:encrypt_password_manager/screen/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import 'screen/add_edit_password_screen/add_new_password.dart';
import 'screen/add_edit_password_screen/edit_password_screen.dart';
import 'screen/entry_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeLightStr =
      await rootBundle.loadString('assets/themes/appainter_themeLight.json');
  final themeLightJson = jsonDecode(themeLightStr);
  final themeLight = ThemeDecoder.decodeThemeData(themeLightJson)!;

  final themeDarktStr =
      await rootBundle.loadString('assets/themes/appainter_themeDark.json');
  final themeLDarkJson = jsonDecode(themeDarktStr);
  final themeDark = ThemeDecoder.decodeThemeData(themeLDarkJson)!;
  runApp(MyApp(
    themeLight: themeLight,
    themeDark: themeDark,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeData themeLight;
  final ThemeData themeDark;
  const MyApp({
    Key? key,
    required this.themeLight,
    required this.themeDark,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderCollections.providers,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Encrypt.',
          theme: Provider.of<ThemeProvider>(context).isDarkMode == true
              ? themeDark.copyWith(
                  appBarTheme: const AppBarTheme(
                    centerTitle: true,
                    backgroundColor: Colors.black,
                  ),
                  scaffoldBackgroundColor: Colors.black,
                )
              : themeLight.copyWith(
                  appBarTheme: const AppBarTheme(centerTitle: true),
                ),
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (_) => const SplashScreen(),
            HomeScreen.routeName: (_) => const HomeScreen(),
            PasswordDetailsScreen.routeName: (_) =>
                const PasswordDetailsScreen(),
            AddNewPasswordScreen.routeName: (_) => const AddNewPasswordScreen(),
            EditPasswordScreen.routeName: (_) => EditPasswordScreen(),
            SettingsScreen.routeName: (_) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
