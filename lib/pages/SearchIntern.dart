import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:internshala/Apis/internships.dart';
import 'package:internshala/Widgets/interns_card.dart';
import 'package:internshala/Widgets/custom_appbar.dart';

class SearchIntern extends StatefulWidget {
  const SearchIntern({super.key});

  @override
  State<SearchIntern> createState() => _SearchInternState();
}

Map<String, dynamic> Internshipslist = {};
List<dynamic> Internshipslistids = [];

class _SearchInternState extends State<SearchIntern> {
  @override
  void initState() {
    setState(() {
      _getlist();
    });
    super.initState();
  }

  _getlist() async {
    Internshipslistids = await _getinterns();
    setState(() {
      Internshipslistids = Internshipslistids;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //custom Appbar
            CustomAppbar(
              internslist: Internshipslist,
              internslistids: Internshipslistids,
              bottom: true,
              title: "Internships",
              searchicon: true,
            ),
            //custom Appbar
            //internships
            Expanded(
              child: ListView.builder(
                itemCount: Internshipslistids.length,
                itemBuilder: (context, index) {
                  return InternsCard(
                      Internshipslist: Internshipslist,
                      Internshipslistids: Internshipslistids,
                      index: index);
                },
              ),
            )
            //internships
          ],
        ),
      ),
    );
  }
}

Future _getinterns() async {
  var ob = Internships();
  final Rawdata = await ob.getdata();
  final data = await json.decode(Rawdata);
  final interns = data["internships_meta"];
  final internsids = data["internship_ids"];
  Internshipslist = interns;

  print(Internshipslistids.length);
  // print(interns[internsids[5].toString()]["title"]);
  return internsids;
}
