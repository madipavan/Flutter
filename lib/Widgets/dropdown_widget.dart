import 'package:flutter/material.dart';
import 'package:internshala/Colors/Colors_used.dart';

List<DropdownMenuItem<String>> items = [
  DropdownMenuItem(
    child: Text(""),
    value: "",
  ),
  DropdownMenuItem(
    child: Text("1"),
    value: "1",
  ),
  DropdownMenuItem(
    child: Text("2"),
    value: "2",
  ),
  DropdownMenuItem(
    child: Text("3"),
    value: "3",
  ),
  DropdownMenuItem(
    child: Text("4"),
    value: "4",
  ),
  DropdownMenuItem(
    child: Text("6"),
    value: "6",
  ),
  DropdownMenuItem(
    child: Text("12"),
    value: "12",
  ),
  DropdownMenuItem(
    child: Text("24"),
    value: "24",
  ),
  DropdownMenuItem(
    child: Text("36"),
    value: "36",
  ),
];

class DropdownWidget extends StatelessWidget {
  final onChanged;
  final dropdownval;
  DropdownWidget({super.key, this.onChanged, this.dropdownval});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: dropdownval,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(
          "Choose Duration",
          style: TextStyle(color: ColorsUsed.textgrey),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsUsed.blue)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsUsed.blue)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsUsed.blue)),
      ),
      iconEnabledColor: ColorsUsed.textgrey,
      items: items,
      onChanged: onChanged,
    );
  }
}
