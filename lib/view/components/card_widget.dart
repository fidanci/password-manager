import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? username;
  final String? url;
  final Function() onPressedCopy;
  final Function() onTap;
  CardWidget({
    Key? key,
    required this.username,
    required this.url,
    required this.onPressedCopy,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text("$username"),
          subtitle: Text("$url"),
          trailing: IconButton(
              icon: Icon(Icons.copy, size: 20), onPressed: onPressedCopy),
        ),
      ),
    );
  }
}
