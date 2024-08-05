import 'package:flutter/material.dart';
import 'package:internshala/Colors/Colors_used.dart';

class CustomTextfeild extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final onChanged;
  CustomTextfeild({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: Colors.grey,
      autofocus: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(
          "Search profile",
          style: TextStyle(color: ColorsUsed.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsUsed.blue)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsUsed.blue)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsUsed.blue)),
      ),
    );
  }
}
