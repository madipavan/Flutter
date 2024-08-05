import 'package:flutter/material.dart';
import 'package:internshala/Apis/profilelist.dart';
import 'package:internshala/Colors/Colors_used.dart';
import 'package:internshala/Widgets/Custom_textfeild.dart';
import 'package:internshala/Widgets/checkboxtext.dart';
import 'package:internshala/Widgets/custom_button.dart';
import 'package:internshala/Widgets/filter_chip.dart';

class AddProfile extends StatefulWidget {
  final filterlist;
  AddProfile({super.key, this.filterlist});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

TextEditingController serchprofilecontroller = TextEditingController();
List<Map<String, dynamic>> _Searchlist = Profilelist.profilelist;
List<Map<String, dynamic>> checked = [];
List<Map<String, dynamic>> selectedfilter = [];

class _AddProfileState extends State<AddProfile> {
  @override
  void initState() {
    setState(() {
      widget.filterlist == null
          ? selectedfilter = []
          : selectedfilter = widget.filterlist;
      selectedfilter.isEmpty ? null : _updateSearchlist();
    });
    super.initState();
  }

  _updateSearchlist() {
    setState(() {
      int i = 0;
      while (i <= selectedfilter.length - 1) {
        int j = 0;
        while (j <= _Searchlist.length - 1) {
          _Searchlist[j]["filter"] == selectedfilter[i]["filter"]
              ? _Searchlist[j]["checked"] = true
              : null;

          if (_Searchlist[j]["filter"] == selectedfilter[i]) break;

          j++;
        }
        i++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return PopScope(
      onPopInvoked: (didpop) {
        setState(() {
          selectedfilter = [];
          _Searchlist.forEach((index) {
            index["checked"] = false;
          });
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            CustomButton(
              text: "Clear all",
              height: Height * 0.04,
              width: Width * 0.24,
              textcolor: ColorsUsed.blue,
              textsize: Width * 0.035,
              onpressed: () {
                setState(() {
                  selectedfilter = [];
                  _Searchlist.forEach((index) {
                    index["checked"] = false;
                  });
                });
              },
            ),
            SizedBox(
              width: Width * 0.02,
            ),
            CustomButton(
              text: "Apply",
              height: Height * 0.04,
              width: Width * 0.2,
              buttonbg: ColorsUsed.blue,
              textcolor: Colors.white,
              textsize: Width * 0.035,
              onpressed: () {
                Navigator.pop(context, selectedfilter);
              },
            ),
            SizedBox(
              width: Width * 0.04,
            ),
            Icon(Icons.notifications_none, size: Width * 0.07),
            SizedBox(
              width: Width * 0.02,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(Width * 0.04),
          child: SafeArea(
              child: Column(
            children: [
              CustomTextfeild(
                  controller: serchprofilecontroller,
                  onChanged: (val) async {
                    _Searchlist = await _searchprofile(val);
                    setState(() {
                      _Searchlist = _Searchlist;
                    });
                  }),
              SizedBox(
                height: Height * 0.02,
              ),
              SizedBox(
                  child: selectedfilter.isEmpty
                      ? SizedBox()
                      : SizedBox(
                          height: Height * 0.04,
                          child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var label = selectedfilter[index]["filter"];
                                return SelectedFilterChip(
                                  label: label,
                                  onPressed: () {
                                    setState(() {
                                      _Searchlist[selectedfilter[index]["id"]]
                                          ["checked"] = false;
                                      selectedfilter.removeAt(index);
                                    });
                                  },
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    width: Width * 0.02,
                                  ),
                              itemCount: selectedfilter.length),
                        )),
              Expanded(
                child: _Searchlist.isEmpty
                    ? Text(
                        "No result found!",
                        style: TextStyle(
                            color: ColorsUsed.textgrey, fontSize: Width * 0.04),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: _Searchlist.length,
                        itemBuilder: (context, index) {
                          var profile = _Searchlist[index]["filter"];

                          return Checkboxtext(
                            profile: profile,
                            onchange: (bool? val) {},
                            ontap: () {
                              setState(() {
                                _Searchlist[index]["checked"]
                                    ? _Searchlist[index]["checked"] = false
                                    : _Searchlist[index]["checked"] = true;

                                _Searchlist[index]["checked"]
                                    ? selectedfilter.add({
                                        "id": index,
                                        "filter": profile,
                                        "checked": _Searchlist[index]
                                            ["checked"],
                                      })
                                    : selectedfilter.removeWhere((item) {
                                        return index == item["id"];
                                      });
                              });
                            },
                            ischecked: _Searchlist[index]["checked"],
                          );
                        }),
              )
            ],
          )),
        ),
      ),
    );
  }
}

Future<dynamic> _searchprofile(searchtext) async {
  List<Map<String, dynamic>> Foundlist = [];
  searchtext.toString().toLowerCase().isEmpty
      ? Foundlist = Profilelist.profilelist
      : Foundlist = Profilelist.profilelist
          .where((element) =>
              element["filter"].toString().toLowerCase().contains(searchtext))
          .toList();

  return Foundlist;
}
