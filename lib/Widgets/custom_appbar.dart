import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internshala/Colors/Colors_used.dart';
import 'package:internshala/Widgets/searchfeild_widget.dart';

class CustomAppbar extends StatefulWidget {
  bool bottom;
  String title;
  bool searchicon;
  final Map<String, dynamic> internslist;
  final List? internslistids;
  CustomAppbar(
      {super.key,
      required this.bottom,
      required this.title,
      this.searchicon = true,
      required this.internslist,
      this.internslistids});
  static List<dynamic> searchlist = [];
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

bool searchfield = false;
TextEditingController controller = TextEditingController();
List<dynamic> searchlist = [];

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    //height and width of device
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    //height and width of device

    return Padding(
      padding: EdgeInsets.all(Width * 0.02),
      child: Container(
        width: Width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: ColorsUsed.bootomboreder,
              width: 3,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(Width * 0.02),
          child: Column(
            children: [
              searchfield
                  ? SearchfeildWidget(
                      onchanged: (val) async {
                        CustomAppbar.searchlist = await Searchinters(val);
                        setState(() {
                          CustomAppbar.searchlist = CustomAppbar.searchlist;
                        });
                      },
                      closepressed: () {
                        setState(() {
                          controller.text = "";
                        });
                      },
                      controller: controller,
                      backpressed: () {
                        setState(() {
                          searchfield = false;
                        });
                      },
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.menu_sharp,
                          size: Width * 0.07,
                        ),
                        SizedBox(
                          width: Width * 0.015,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: Width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: Width * 0.2,
                        ),
                        Visibility(
                          visible: widget.searchicon,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                searchfield = true;
                              });
                            },
                            child: Icon(
                              Icons.search_rounded,
                              size: Width * 0.07,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Width * 0.03,
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: Width * 0.07,
                        ),
                        SizedBox(
                          width: Width * 0.03,
                        ),
                        Icon(
                          Icons.notifications_none,
                          size: Width * 0.07,
                        ),
                        SizedBox(
                          width: Width * 0.03,
                        ),
                        Icon(
                          Icons.messenger_outline_rounded,
                          size: Width * 0.07,
                        ),
                      ],
                    ),
              Visibility(
                visible: widget.bottom,
                child: InkWell(
                  onTap: () async {
                    dynamic data =
                        await Navigator.pushNamed(context, "/add_filters");
                    data != null ? setState(() {}) : null;
                  },
                  child: Container(
                    height: Height * 0.04,
                    width: Width * 0.2,
                    margin: EdgeInsets.only(top: Width * 0.08),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(width: 1, color: ColorsUsed.blue)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_alt_outlined,
                          size: Width * 0.05,
                          color: ColorsUsed.blue,
                        ),
                        Text(
                          "Filters",
                          style: TextStyle(
                              fontSize: Width * 0.038, color: ColorsUsed.blue),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Height * 0.01,
              ),
              Visibility(
                visible: widget.bottom,
                child: Container(
                  width: Width * 0.35,
                  height: Height * 0.025,
                  child: Center(
                    child: Text(
                      widget.internslistids!.length.toString() +
                          " total internships",
                      style: TextStyle(
                          fontSize: Width * 0.032, color: ColorsUsed.textgrey),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Searchinters(searchtext) async {}
}
