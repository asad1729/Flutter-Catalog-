import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Flutter";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        backgroundColor: Colors.lime,
      ),
      body: Center(
        child: Container(
          child: Text(" Welcome to $days days of development using $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
