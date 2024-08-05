import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextContainer extends StatelessWidget {
  final height;
  final width;
  Widget? icon;
  Color? bgcolor;
  Color? textcolor;
  String? text;
  final textsize;
  MainAxisAlignment alignment;

  TextContainer(
      {super.key,
      required this.height,
      required this.width,
      this.icon,
      this.bgcolor,
      required this.text,
      required this.textsize,
      this.textcolor,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          SizedBox(child: icon),
          Text(
            text.toString(),
            style: TextStyle(fontSize: textsize, color: textcolor),
          ),
        ],
      ),
    );
  }
}
