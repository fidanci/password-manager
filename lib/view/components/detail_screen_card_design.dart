import 'package:flutter/material.dart';

class DetailCardWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool isObscureText;
  final Widget? suffixIcon;
  DetailCardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.isObscureText,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = subTitle ?? "";
    return Card(
      child: ListTile(
        title: Text(
          "${this.title}",
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
          enabled: false,
          obscureText: isObscureText,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        trailing: suffixIcon,
      ),
    );
  }
}
