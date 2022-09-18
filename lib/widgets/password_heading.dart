import 'package:flutter/material.dart';

import '../constants/text_style_collections.dart';

class PasswordHeaderField extends StatelessWidget {
  final String header;
  const PasswordHeaderField({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: TextStyleCollection.passwordDetailsHeading,
    );
  }
}
