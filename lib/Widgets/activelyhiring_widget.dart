import 'package:flutter/material.dart';
import 'package:internshala/Colors/Colors_used.dart';

class ActivelyhiringWidget extends StatelessWidget {
  const ActivelyhiringWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    //height and width of device
    return Container(
      height: Height * 0.03,
      width: Width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: ColorsUsed.bootomboreder),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.trending_up,
            color: ColorsUsed.blue,
            size: Width * 0.05,
          ),
          Text(
            "Actively hiring",
            style: TextStyle(fontSize: Width * 0.032),
          )
        ],
      ),
    );
  }
}
