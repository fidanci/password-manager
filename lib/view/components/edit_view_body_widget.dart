import 'package:flutter/material.dart';

class EditScreenBodyWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget body;

  const EditScreenBodyWidget(
      {Key? key, this.height, this.width, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 1.5),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: this.body,
      ),
    );
  }
}
