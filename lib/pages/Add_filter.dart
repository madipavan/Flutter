import 'package:flutter/material.dart';
import 'package:internshala/Colors/Colors_used.dart';
import 'package:internshala/Widgets/custom_button.dart';
import 'package:internshala/Widgets/dropdown_widget.dart';
import 'package:internshala/Widgets/filter_chip.dart';

import 'package:internshala/Widgets/greytext_heading.dart';

import 'package:internshala/Widgets/text_container.dart';
import 'package:internshala/pages/Add_city.dart';
import 'package:internshala/pages/Add_profile.dart';

class AddFilter extends StatefulWidget {
  const AddFilter({super.key});

  @override
  State<AddFilter> createState() => _AddFilterState();
}

List<Map<String, dynamic>> filterscreenlist = [];
List<Map<String, dynamic>> cityscreenlist = [];
List<dynamic> Finalfilters = [];
String maximumduration = "1";

class _AddFilterState extends State<AddFilter> {
  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          "Filters",
          style: TextStyle(
            fontSize: Width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.bookmark_border,
            size: Width * 0.07,
          ),
          SizedBox(
            width: Width * 0.02,
          ),
          Icon(Icons.notifications_none, size: Width * 0.07),
          SizedBox(
            width: Width * 0.02,
          ),
          Icon(Icons.messenger_outline_rounded, size: Width * 0.07),
          SizedBox(
            width: Width * 0.02,
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreytextHeading(text: "PROFILE"),
            SizedBox(
              height: Height * 0.015,
            ),
            SizedBox(
              child: filterscreenlist.isEmpty
                  ? SizedBox()
                  : SizedBox(
                      height: Height * 0.04,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: Width * 0.02,
                        ),
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var label = filterscreenlist[index]["filter"];
                          return SelectedFilterChip(
                            onPressed: () {
                              setState(() {
                                filterscreenlist.removeAt(index);
                              });
                            },
                            label: label,
                          );
                        },
                        itemCount: filterscreenlist.length,
                      ),
                    ),
            ),
            SizedBox(
              height: Height * 0.015,
            ),
            InkWell(
              onTap: () async {
                dynamic data = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddProfile(
                              filterlist: filterscreenlist,
                            )));
                setState(() {
                  if (data != null)
                    filterscreenlist = data;
                  else
                    filterscreenlist = [];
                });
              },
              child: TextContainer(
                height: Height * 0.04,
                width: Width * 0.3,
                text: "Add profile",
                textsize: Width * 0.04,
                alignment: MainAxisAlignment.spaceAround,
                textcolor: ColorsUsed.blue,
                icon: Icon(
                  Icons.add,
                  size: Width * 0.05,
                  color: ColorsUsed.blue,
                ),
              ),
            ),
            SizedBox(
              height: Height * 0.025,
            ),
            GreytextHeading(text: "CITY"),
            SizedBox(
              height: Height * 0.015,
            ),
            SizedBox(
              child: cityscreenlist.isEmpty
                  ? SizedBox()
                  : SizedBox(
                      height: Height * 0.04,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: Width * 0.02,
                        ),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var city = cityscreenlist[index]["filter"];
                          return SelectedFilterChip(
                            onPressed: () {
                              setState(() {
                                cityscreenlist.removeAt(index);
                              });
                            },
                            label: city,
                          );
                        },
                        itemCount: cityscreenlist.length,
                      ),
                    ),
            ),
            SizedBox(
              height: Height * 0.015,
            ),
            InkWell(
              onTap: () async {
                dynamic data = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddCity(
                              filterlist: cityscreenlist,
                            )));
                setState(() {
                  if (data != null)
                    cityscreenlist = data;
                  else
                    cityscreenlist = [];
                });
              },
              child: TextContainer(
                height: Height * 0.04,
                width: Width * 0.25,
                text: "Add city",
                textsize: Width * 0.04,
                alignment: MainAxisAlignment.spaceAround,
                textcolor: ColorsUsed.blue,
                icon: Icon(
                  Icons.add,
                  size: Width * 0.05,
                  color: ColorsUsed.blue,
                ),
              ),
            ),
            SizedBox(
              height: Height * 0.025,
            ),
            GreytextHeading(text: "MAXIMUM DURATION (IN MONTHS)"),
            SizedBox(
              height: Height * 0.025,
            ),
            DropdownWidget(
              dropdownval: maximumduration,
              onChanged: (val) {
                setState(() {
                  maximumduration = val.toString();
                });
              },
            ),
            SizedBox(
              height: Height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Clear all",
                  height: Height * 0.06,
                  width: Width * 0.45,
                  textcolor: ColorsUsed.blue,
                  bordercolor: ColorsUsed.blue,
                  textsize: Width * 0.04,
                  onpressed: () {
                    setState(() {
                      cityscreenlist = [];
                      filterscreenlist = [];
                      maximumduration = "";
                    });
                  },
                ),
                CustomButton(
                  text: "Apply",
                  height: Height * 0.06,
                  width: Width * 0.45,
                  buttonbg: ColorsUsed.blue,
                  textcolor: Colors.white,
                  textsize: Width * 0.04,
                  onpressed: () {
                    Finalfilters.add(cityscreenlist);
                    Finalfilters.add(filterscreenlist);
                    Finalfilters.add(maximumduration);

                    Navigator.pop(context, Finalfilters);
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
