import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
   ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,  this.color= Colors.white,  this.backgroundColor=Colors.black,
  }) : super(key: key);
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: color),
      ),
    );
  }
}
