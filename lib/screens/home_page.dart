import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Flutter";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App", style: TextStyle(color: Colors.black)),
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
