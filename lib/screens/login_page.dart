import 'package:flutter/material.dart';

class log_in_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Text(
        "Login Page",
        style: TextStyle(
            fontSize: 20, color: Colors.purple, fontWeight: FontWeight.normal),
        textScaleFactor: 3.0,
      ),
    ));
  }
}
