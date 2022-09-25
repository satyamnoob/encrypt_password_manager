import 'package:encrypt_password_manager/model/password.dart';
import 'package:encrypt_password_manager/provider/master_password_provider.dart';
import 'package:encrypt_password_manager/provider/passwords_provider.dart';
import 'package:encrypt_password_manager/screen/home_screen/password_details_screen.dart';
import 'package:encrypt_password_manager/screen/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style_collections.dart';
import '../../widgets/password_tile.dart';
import '../add_edit_password_screen/add_new_password.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController? _masterPasswordController;
  // initAsync() async {
  //   _showWelcomeDialog();
  // }

  // _showWelcomeDialog() async {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) async {
  //       await _welcomeDialog(); //
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // initAsync();
  }

  @override
  void dispose() {
    super.dispose();
    // if (_masterPasswordController != null) {
    //   _masterPasswordController!.dispose();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final List<Password> passwords =
        Provider.of<PasswordsProvider>(context).passwords;
    print(
        "Masterpassword -------------->${Provider.of<MasterPasswordProvider>(context).masterpassword}");
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Encry',
              style: TextStyleCollection.appbarTextStyle1,
            ),
            Text(
              'pt.',
              style: TextStyleCollection.appbarTextStyle2,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },
          icon: const Icon(Icons.settings_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewPasswordScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: passwords.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        PasswordDetailsScreen.routeName,
                        arguments: passwords[index],
                      );
                    },
                    child: PasswordTile(password: passwords[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _welcomeDialog() {
  //   AlertDialog alert = AlertDialog(
  //     title: Row(
  //       children: [
  //         Text(
  //           "Welcome To Encry",
  //           style: TextStyleCollection.appbarTextStyle1,
  //         ),
  //         Text(
  //           "pt.",
  //           style: TextStyleCollection.appbarTextStyle2,
  //         ),
  //       ],
  //     ),
  //     content: const Text(
  //         "Encrypt. is a open source password manager built using Crypt.sha256 which is a one-way hash function developed by the NSA."),
  //     actions: [
  //       ElevatedButton(
  //         child: const Text("Next"),
  //         onPressed: () async {
  //           await _masterPasswordDialog();
  //           // ignore: use_build_context_synchronously
  //           Navigator.pop(context);
  //         },
  //       ),
  //     ],
  //   );
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) => alert,
  //   );
  // }

  // _masterPasswordDialog() {
  //   AlertDialog alert = AlertDialog(
  //     title: Row(
  //       children: [
  //         Text(
  //           "Welcome To Encry",
  //           style: TextStyleCollection.appbarTextStyle1,
  //         ),
  //         Text(
  //           "pt.",
  //           style: TextStyleCollection.appbarTextStyle2,
  //         ),
  //       ],
  //     ),
  //     content: const Text(
  //         "To use Encrypt. you need to set up a master password. We will hash and safely secure all your passwords using this master password. Beware! If you forget this master password, all your saved passwords will be gone."),
  //     actions: [
  //       ElevatedButton(
  //         child: const Text("Next"),
  //         onPressed: () async {
  //           await _setMasterPasswordDialog();
  //           // ignore: use_build_context_synchronously
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ],
  //   );
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) => alert,
  //   );
  // }

  // _setMasterPasswordDialog() {
  //   _masterPasswordController = TextEditingController();
  //   bool _validate = false;
  //   AlertDialog alert = AlertDialog(
  //     title: Row(
  //       children: [
  //         Text(
  //           "Welcome To Encry",
  //           style: TextStyleCollection.appbarTextStyle1,
  //         ),
  //         Text(
  //           "pt.",
  //           style: TextStyleCollection.appbarTextStyle2,
  //         ),
  //       ],
  //     ),
  //     content: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "Setup master password.",
  //         ),
  //         TextField(
  //           decoration: InputDecoration(
  //             labelText: 'atleat 8 characters long',
  //             errorText: _validate ? 'Value Can\'t Be Empty' : null,
  //           ),
  //           style: TextStyleCollection.passwordDetails,
  //           controller: _masterPasswordController,
  //         ),
  //       ],
  //     ),
  //     actions: [
  //       ElevatedButton(
  //         child: const Text("Next"),
  //         onPressed: () async {
  //           setState(
  //             () {
  //               _masterPasswordController!.text.isEmpty
  //                   ? _validate = true
  //                   : _validate = false;
  //             },
  //           );
  //           // await _setMasterPasswordDialog();
  //           // ignore: use_build_context_synchronously
  //           // Navigator.of(context).pop();
  //         },
  //       ),
  //     ],
  //   );
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) => alert,
  //   );
  // }
}
