import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshala/pages/Add_filter.dart';
import 'package:internshala/pages/Add_profile.dart';
import 'package:internshala/pages/SearchIntern.dart';
import 'package:internshala/pages/Splashscreen.dart';

void main() {
  runApp(const App());

  //setting statusbar style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  //setting statusbar style
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Splashscreen(),
        "/home": (context) => const SearchIntern(),
        "/add_filters": (context) => const AddFilter(),
        "/addprofile": (context) => AddProfile(),
      },
    );
  }
}
