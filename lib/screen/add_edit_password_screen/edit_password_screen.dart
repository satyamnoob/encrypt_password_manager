import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/sized_box.dart';
import '../../constants/text_style_collections.dart';
import '../../model/password.dart';
import '../../provider/password_settings_provider.dart';
import '../../provider/passwords_provider.dart';
import '../../widgets/generate_password.dart';
import '../../widgets/password_heading.dart';

// ignore: must_be_immutable
class EditPasswordScreen extends StatefulWidget {
  static const routeName = '/edit-password';
  bool _init = true;
  EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameUrlController;
  late final TextEditingController _usernameEmailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _notesController;
  late final Password password;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget._init) {
      password = ModalRoute.of(context)!.settings.arguments as Password;
      _nameUrlController = TextEditingController(text: password.nameOrUrl);
      _usernameEmailController =
          TextEditingController(text: password.usernameOrEmail);
      _passwordController = TextEditingController(text: password.password);
      _notesController = TextEditingController(text: password.notes ?? '');
      widget._init = false;
    }
  }

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
        (Provider.of<PasswordSettingsProvider>(context).password == '')
            ? _passwordController.text
            : Provider.of<PasswordSettingsProvider>(context).password;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Edit ',
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
                    onChanged: (value) {
                      // print(_nameUrlController.text);
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
                      onChanged: (value) {
                        // print(_usernameEmailController.text);
                      }),
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
                    onChanged: (value) {
                      // print(_passwordController.text);
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
                    onChanged: (value) {
                      // print(_notesController.text);
                    },
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
      Provider.of<PasswordsProvider>(context, listen: false).editPassword(
        id: password.id,
        nameOrUrl: _nameUrlController.text,
        usernameOrEmail: _usernameEmailController.text,
        password: _passwordController.text,
        notes: _notesController.text == '' ? null : _notesController.text,
      );
      Provider.of<PasswordSettingsProvider>(
        context,
        listen: false,
      ).deleteGeneratedPassword();
      Navigator.of(context).pop();
    }
  }
}
