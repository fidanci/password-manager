import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? initValue;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Function(String) onChanged;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.obscureText,
    this.keyboardType,
    this.suffixIcon,
    required this.onChanged,
    this.initValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
        initialValue: initValue,
        validator: (String? value) {
          if (value == null) {
            throw "Bu alan boş olamaz";
          }
        },
      ),
    );
  }
}
