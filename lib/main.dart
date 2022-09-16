import 'package:encrypt_password_manager/provider/collection/provider_collections.dart';
import 'package:encrypt_password_manager/screen/home_screen/home_screen.dart';
import 'package:encrypt_password_manager/screen/home_screen/password_details_screen.dart';
import 'package:encrypt_password_manager/screen/other_screen/add_new_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/entry_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderCollections.providers,
      child: MaterialApp(
        title: 'Encrypt.',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Poppins',
        ),
        // home: const SplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          PasswordDetailsScreen.routeName: (_) => const PasswordDetailsScreen(),
          AddNewPasswordScreen.routeName: (_) => const AddNewPasswordScreen(),
        },
      ),
    );
  }
}
