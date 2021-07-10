import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class PinCodeWidget extends StatelessWidget {
  late String? pinChanged;
  final Function(String)? onCompleted;
  PinCodeWidget({
    Key? key,
    required this.pinChanged,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 7,
      obscureText: true,
      showCursor: false,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(inactiveColor: Colors.white),
      onChanged: (String value) {
        this.pinChanged = value;
      },
      onCompleted: onCompleted,
    );
  }
}
