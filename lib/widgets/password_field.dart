import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/sized_box.dart';
import '../constants/text_style_collections.dart';
import '../constants/types.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.heading,
    required this.value,
    this.type = PasswordFieldType.others,
  }) : super(key: key);

  final String heading;
  final String value;
  final PasswordFieldType type;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    SnackBar snackBar =
        SnackBar(content: Text('${widget.heading} copied to clipboard'));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: TextStyleCollection.passwordDetailsHeading,
        ),
        SizedBoxes.sizedBox10,
        if (widget.type == PasswordFieldType.others)
          Text(
            widget.value,
            style: TextStyleCollection.passwordDetails,
          ),
        if (widget.type == PasswordFieldType.password) ...[
          Text(
            widget.value,
            style: TextStyleCollection.passwordDetails,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.value)).then(
                  (value) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              },
              child: FittedBox(
                child: Text(
                  'Copy',
                  style: TextStyleCollection.elevatedButton,
                ),
              ),
            ),
          ),
        ],
        SizedBoxes.sizedBox20,
      ],
    );
  }
}
