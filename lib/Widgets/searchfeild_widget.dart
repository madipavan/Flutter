import 'package:flutter/material.dart';
import 'package:internshala/Colors/Colors_used.dart';

class SearchfeildWidget extends StatelessWidget {
  final backpressed;
  final closepressed;
  final controller;
  final onchanged;
  SearchfeildWidget(
      {super.key,
      this.backpressed,
      this.controller,
      this.closepressed,
      this.onchanged});

  @override
  Widget build(BuildContext context) {
    //height and width of device

    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return Container(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
              onPressed: backpressed,
              icon: Icon(
                Icons.arrow_back,
                size: Width * 0.06,
              )),
          SizedBox(
              width: Width * 0.75,
              child: TextField(
                onChanged: onchanged,
                controller: controller,
                cursorColor: ColorsUsed.blue,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(Width * 0.02),
                  hintText: "Category, location or Company",
                  hintStyle: TextStyle(fontSize: Width * 0.04),
                  hintFadeDuration: Duration(milliseconds: 500),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: Width * 0.06,
                    ),
                    onPressed: closepressed,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                ),
              ))
        ],
      ),
    );
  }
}
