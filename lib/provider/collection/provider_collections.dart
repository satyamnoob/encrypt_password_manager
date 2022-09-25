import 'package:encrypt_password_manager/provider/first_time_opening_app_provider.dart';
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../theme_provider.dart';

class ProviderCollections {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => PasswordsProvider()),
    ChangeNotifierProvider(create: (_) => PasswordSettingsProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => FirstTimeOpeningAppProvider()),
    ChangeNotifierProvider(create: (_) => MasterPasswordProvider()),
  ];
}
