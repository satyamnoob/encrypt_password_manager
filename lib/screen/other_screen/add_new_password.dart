import 'package:carbon_icons/carbon_icons.dart';
import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/sized_box.dart';
import '../../constants/text_style_collections.dart';
import '../../widgets/password_heading.dart';

class AddNewPasswordScreen extends StatelessWidget {
  static const routeName = '/add-new-password';
  AddNewPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController nameUrlController = TextEditingController();
  final TextEditingController usernameEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Password'),
        leading: IconButton(
          onPressed: () {
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
                    controller: nameUrlController,
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
                    controller: usernameEmailController,
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
                    controller: passwordController,
                    style: TextStyleCollection.passwordDetails,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter PASSWORD.';
                      }
                      return null;
                    },
                  ),
                  SizedBoxes.sizedBox20,
                  const PasswordHeaderField(header: 'NOTES'),
                  TextFormField(
                    controller: notesController,
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
      print(notesController.text);
      Provider.of<PasswordsProvider>(context, listen: false).addPassword(
        nameOrUrl: nameUrlController.text.trim(),
        password: passwordController.text.trim(),
        usernameOrEmail: usernameEmailController.text.trim(),
        notes: notesController.text.trim() == ''
            ? null
            : notesController.text.trim(),
      );
      Navigator.of(context).pop();
    }
  }
}
