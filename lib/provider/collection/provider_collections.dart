import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderCollections {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => PasswordsProvider()),
  ];
}
