import 'package:flutter/material.dart';
import 'package:internshala/Colors/Colors_used.dart';

class SelectedFilterChip extends StatelessWidget {
  String label;
  final onPressed;
  SelectedFilterChip({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return Container(
        height: Height * 0.01,
        decoration: BoxDecoration(
            color: ColorsUsed.blue, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            SizedBox(
              width: Width * 0.035,
            ),
            Text(
              label,
              style: TextStyle(fontSize: Width * 0.04, color: Colors.white),
            ),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: Width * 0.05,
                ))
          ],
        ));
  }
}
