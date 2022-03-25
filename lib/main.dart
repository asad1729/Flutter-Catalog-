import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/screens/cart_page.dart';
import 'package:flutter_catalog/screens/home_page.dart';
import 'package:flutter_catalog/screens/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
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
        themeMode: ThemeMode.system,
        theme: Mythemes.lightTheme(context),
        //darkTheme: Mythemes.darkTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => log_in_page(),
          MyRoutes.loginRoute: (context) => log_in_page(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.CartRoute: (context) => CartPage(),
        });
  }
}
