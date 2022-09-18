import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/sized_box.dart';
import '../../constants/text_style_collections.dart';
import '../../model/password.dart';
import '../../provider/passwords_provider.dart';
import '../../widgets/password_heading.dart';

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
  Widget build(BuildContext context) {
    void _submitForm(BuildContext context) {
      if (_formKey.currentState!.validate()) {
        print(_notesController.text);
        Provider.of<PasswordsProvider>(context, listen: false).editPassword(
          id: password.id,
          nameOrUrl: _nameUrlController.text,
          usernameOrEmail: _usernameEmailController.text,
          password: _passwordController.text,
          notes: _notesController.text == '' ? null : _notesController.text,
        );
        Navigator.of(context).pop();
      }
    }

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
                    controller: _nameUrlController,
                    style: TextStyleCollection.passwordDetails,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter NAME/URL.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(_nameUrlController.text);
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
                        print(_usernameEmailController.text);
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
                      print(_passwordController.text);
                    },
                  ),
                  SizedBoxes.sizedBox20,
                  const PasswordHeaderField(header: 'NOTES'),
                  TextFormField(
                    controller: _notesController,
                    style: TextStyleCollection.passwordDetails,
                    onChanged: (value) {
                      print(_notesController.text);
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
}
