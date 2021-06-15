import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function() onPressed;
  const ElevatedButtonWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      icon: icon,
      label: Text("$text"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white30),
        shape: MaterialStateProperty.all(StadiumBorder()),
        fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width / 2)),
      ),
      onPressed: onPressed,
    );
  }
}
