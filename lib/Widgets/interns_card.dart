import 'package:flutter/material.dart';
import 'package:internshala/Widgets/activelyhiring_widget.dart';
import 'package:internshala/Widgets/custom_button.dart';
import 'package:internshala/Widgets/text_container.dart';

import 'package:internshala/Colors/Colors_used.dart';

var bottomborder = BoxDecoration(
  border:
      Border(bottom: BorderSide(width: 10, color: ColorsUsed.bootomboreder)),
);

class InternsCard extends StatelessWidget {
  final Internshipslist;
  final Internshipslistids;
  final index;
  InternsCard(
      {super.key, this.Internshipslist, this.Internshipslistids, this.index});

  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return Container(
      height: Height * 0.5,
      width: Width,
      decoration: bottomborder,
      child: Padding(
        padding: EdgeInsets.all(Width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivelyhiringWidget(),
            Container(
                width: Width,
                // height: Height * 0.065,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Width * 0.5,
                      // height: Height * 0.065,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Internshipslist[
                                Internshipslistids[index].toString()]["title"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Width * 0.05),
                          ),
                          Text(
                            Internshipslist[Internshipslistids[index]
                                .toString()]["company_name"],
                            style: TextStyle(
                                fontSize: Width * 0.04,
                                color: ColorsUsed.textgrey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Height * 0.065,
                      width: Width * 0.2,
                      child: Text("logo"),
                    )
                  ],
                )),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: Width * 0.05,
                ),
                SizedBox(
                  width: Width * 0.01,
                ),
                Text(
                  Internshipslist[Internshipslistids[index].toString()]
                          ["is_external"]
                      ? Internshipslist[Internshipslistids[index].toString()]
                          ["locations"][0]["string"]
                      : "Work from home",
                  style: TextStyle(fontSize: Width * 0.04),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.play_circle_outline_sharp,
                  size: Width * 0.05,
                ),
                SizedBox(
                  width: Width * 0.01,
                ),
                Text(
                  Internshipslist[Internshipslistids[index].toString()]
                      ["start_date"],
                  style: TextStyle(fontSize: Width * 0.04),
                ),
                SizedBox(
                  width: Width * 0.05,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: Width * 0.05,
                ),
                SizedBox(
                  width: Width * 0.02,
                ),
                Text(
                  Internshipslist[Internshipslistids[index].toString()]
                      ["duration"],
                  style: TextStyle(fontSize: Width * 0.04),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.account_balance_sharp,
                  size: Width * 0.05,
                ),
                SizedBox(
                  width: Width * 0.01,
                ),
                Text(
                  Internshipslist[Internshipslistids[index].toString()]
                      ["stipend"]["salary"],
                  style: TextStyle(fontSize: Width * 0.04),
                )
              ],
            ),
            TextContainer(
              height: Height * 0.025,
              width: Width * 0.2,
              text: Internshipslist[Internshipslistids[index].toString()]
                  ["employment_type"],
              textsize: Width * 0.035,
              bgcolor: Colors.grey.shade300,
              alignment: MainAxisAlignment.center,
            ),
            TextContainer(
                height: Height * 0.025,
                width: Width * 0.25,
                text: Internshipslist[Internshipslistids[index].toString()]
                    ["posted_by_label"],
                textsize: Width * 0.035,
                bgcolor: Colors.grey.shade300,
                icon: Icon(
                  Icons.watch_later_outlined,
                  size: Width * 0.05,
                ),
                alignment: MainAxisAlignment.spaceAround),
            Divider(
              color: Colors.grey.shade400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    child: Text(
                  "View details",
                  style:
                      TextStyle(color: ColorsUsed.blue, fontSize: Width * 0.04),
                )),
                SizedBox(
                  width: Width * 0.05,
                ),
                CustomButton(
                  text: "Apply now",
                  height: Height * 0.05,
                  width: Width * 0.35,
                  buttonbg: ColorsUsed.blue,
                  textcolor: Colors.white,
                  textsize: Width * 0.04,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
