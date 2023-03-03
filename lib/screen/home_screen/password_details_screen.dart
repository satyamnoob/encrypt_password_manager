import 'package:carbon_icons/carbon_icons.dart';
import 'package:encrypt_password_manager/constants/common_alert_dialogs.dart';
import 'package:encrypt_password_manager/constants/types.dart';
import 'package:encrypt_password_manager/model/password.dart';
import 'package:flutter/material.dart';

import '../../widgets/password_field.dart';
import '../add_edit_password_screen/edit_password_screen.dart';

// ignore: must_be_immutable
class PasswordDetailsScreen extends StatefulWidget {
  static const routeName = '/password-details';
  bool init = false;
  PasswordDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PasswordDetailsScreen> createState() => _PasswordDetailsScreenState();
}

class _PasswordDetailsScreenState extends State<PasswordDetailsScreen> {
  late final TextEditingController _masterPasswordController;
  String _decryptedPassword = "";
  @override
  void initState() {
    super.initState();
    _masterPasswordController = TextEditingController();
    Future.delayed(
      Duration.zero,
      () {
        setState(() {
          password = ModalRoute.of(context)!.settings.arguments as Password;
        });
        WidgetsBinding.instance.addPostFrameCallback(
          (_) async {
            await CommonAlertDialogs.decryptPasswordDialog(
              context: context,
              id: password.id,
              masterPasswordController: _masterPasswordController,
            ).then(
              (value) => setState(() {
                print("Password --------------------------> $value");
                _decryptedPassword = value;
              }),
            );
          },
        );
      },
    );
  }

  late final Password password;

  @override
  Widget build(BuildContext context) {
    final Password _password =
        ModalRoute.of(context)!.settings.arguments as Password;

    return Scaffold(
      appBar: AppBar(
        title: Text(_password.nameOrUrl),
        leading: IconButton(
          onPressed: () {
            _password.password = _password.password;
            Navigator.pop(context);
          },
          icon: const Icon(
            CarbonIcons.arrow_left,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(
                    EditPasswordScreen.routeName,
                    arguments: _password,
                  )
                  .then((_) => setState(() {}));
            },
            icon: const Icon(CarbonIcons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PasswordField(
                  heading: 'NAME/URL',
                  value: _password.nameOrUrl,
                ),
                PasswordField(
                  heading: 'USERNAME/EMAIL',
                  value: _password.usernameOrEmail,
                ),
                PasswordField(
                  heading: 'PASSWORD',
                  value: _decryptedPassword,
                  type: PasswordFieldType.password,
                ),
                PasswordField(
                  heading: 'NOTES',
                  value: _password.notes ?? 'No Notes Added',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
