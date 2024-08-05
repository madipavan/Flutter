import 'package:flutter/material.dart';
import 'package:internshala/Colors/Colors_used.dart';

class Checkboxtext extends StatefulWidget {
  final String profile;
  final ontap;
  final onchange;
  final ischecked;
  Checkboxtext(
      {super.key,
      required this.profile,
      required this.onchange,
      required this.ontap,
      required this.ischecked});

  @override
  State<Checkboxtext> createState() => _CheckboxtextState();
}

class _CheckboxtextState extends State<Checkboxtext> {
  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: Width,
        height: Height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: Width * 0.0025,
              child: Checkbox(
                activeColor: ColorsUsed.blue,
                value: widget.ischecked,
                onChanged: widget.onchange,
              ),
            ),
            SizedBox(
              width: Width * 0.03,
            ),
            Text(
              widget.profile,
              style: TextStyle(fontSize: Width * 0.045),
            ),
          ],
        ),
      ),
    );
  }
}
