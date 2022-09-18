import 'package:carbon_icons/carbon_icons.dart';
import 'package:encrypt_password_manager/provider/password_settings_provider.dart';
import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/sized_box.dart';
import '../../constants/text_style_collections.dart';
import '../../widgets/generate_password.dart';
import '../../widgets/password_heading.dart';

class AddNewPasswordScreen extends StatefulWidget {
  static const routeName = '/add-new-password';
  const AddNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<AddNewPasswordScreen> createState() => _AddNewPasswordScreenState();
}

class _AddNewPasswordScreenState extends State<AddNewPasswordScreen> {
  final TextEditingController _nameUrlController = TextEditingController();

  final TextEditingController _usernameEmailController =
      TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameUrlController.dispose();
    _usernameEmailController.dispose();
    _passwordController.dispose();
    _notesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _passwordController.text =
        Provider.of<PasswordSettingsProvider>(context).password;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add New ',
              style: TextStyleCollection.appbarTextStyle1,
            ),
            Text(
              'Password',
              style: TextStyleCollection.appbarTextStyle2,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Provider.of<PasswordSettingsProvider>(
              context,
              listen: false,
            ).deleteGeneratedPassword();
            Navigator.pop(context);
          },
          icon: const Icon(
            CarbonIcons.arrow_left,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _submitForm(context);
            },
            icon: const Icon(CarbonIcons.save),
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PasswordHeaderField(header: 'NAME/URL*'),
                  TextFormField(
                    controller: _nameUrlController,
                    style: TextStyleCollection.passwordDetails,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter NAME/URL.';
                      }
                      return null;
                    },
                  ),
                  SizedBoxes.sizedBox20,
                  const PasswordHeaderField(header: 'USERNAME/EMAIL*'),
                  TextFormField(
                    controller: _usernameEmailController,
                    style: TextStyleCollection.passwordDetails,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter USERNAME/EMAIL.';
                      }
                      return null;
                    },
                  ),
                  SizedBoxes.sizedBox20,
                  const PasswordHeaderField(header: 'PASSWORD*'),
                  TextFormField(
                    controller: _passwordController,
                    style: TextStyleCollection.passwordDetails,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter PASSWORD.';
                      }
                      return null;
                    },
                  ),
                  SizedBoxes.sizedBox20,
                  const GeneratePassword(),
                  SizedBoxes.sizedBox20,
                  const PasswordHeaderField(header: 'NOTES'),
                  TextFormField(
                    maxLines: 3,
                    controller: _notesController,
                    style: TextStyleCollection.passwordDetails,
                  ),
                  SizedBoxes.sizedBox20,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // print(_notesController.text);
      Provider.of<PasswordsProvider>(context, listen: false).addPassword(
        nameOrUrl: _nameUrlController.text.trim(),
        password: _passwordController.text.trim(),
        usernameOrEmail: _usernameEmailController.text.trim(),
        notes: _notesController.text.trim() == ''
            ? null
            : _notesController.text.trim(),
      );
      Provider.of<PasswordSettingsProvider>(
        context,
        listen: false,
      ).deleteGeneratedPassword();
      Navigator.of(context).pop();
    }
  }
}
