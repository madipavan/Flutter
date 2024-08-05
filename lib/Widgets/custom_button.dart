import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final height;
  final width;
  final onpressed;
  final textsize;
  Color? buttonbg;
  Color? textcolor;
  Color bordercolor;

  CustomButton({
    super.key,
    required this.text,
    this.buttonbg,
    required this.height,
    required this.width,
    this.onpressed,
    this.textcolor,
    this.textsize,
    this.bordercolor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: buttonbg,
                side: BorderSide(color: bordercolor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: onpressed,
            child: Text(
              text,
              style: TextStyle(color: textcolor, fontSize: textsize),
            )));
  }
}
