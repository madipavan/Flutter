import 'package:flutter/material.dart';

class GreytextHeading extends StatelessWidget {
  String text;
  GreytextHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return Text(
      text,
      style: TextStyle(fontSize: Width * 0.04, color: Colors.grey.shade700),
    );
  }
}
