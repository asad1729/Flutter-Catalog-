import 'package:flutter/material.dart';
import 'package:flutter_catalog/screens/home_page.dart';
import 'package:flutter_catalog/screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* double pi = 3.14;
    bool isNumber = true;
    num temp = 20.5;
    var day = "tuesday";
    const pi1 = 3.14; */

    return MaterialApp(
        /*  home: HomePage(), */
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.purple),
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: "/login",
        routes: {
          "/": (context) => log_in_page(),
          "/login": (context) => log_in_page(),
          "/home": (context) => HomePage(),
        });
  }
}
