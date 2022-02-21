import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class log_in_page extends StatefulWidget {
  @override
  State<log_in_page> createState() => _log_in_pageState();
}

class _log_in_pageState extends State<log_in_page> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                //height: 500,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 32.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your Username",
                            labelText: "Username",
                          ),
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        InkWell(
                            onTap: () async {
                              setState(() {
                                changeButton = true;
                              });
                              await Future.delayed(Duration(seconds: 1));
                              // Navigator.pushNamed(context, MyRoutes.homeRoute);
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 50,
                              width: changeButton ? 50 : 150,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(Icons.done, color: Colors.white)
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                              decoration: BoxDecoration(
                                color: Colors.purpleAccent,
                                shape: changeButton
                                    ? BoxShape.circle
                                    : BoxShape.rectangle,
                                /*  borderRadius: BorderRadius.circular(10)), */
                              ),
                            )
                            /*  ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.homeRoute);
                          },
                          child: Text("Log In"),
                          style:
                              TextButton.styleFrom(minimumSize: Size(150, 50))) */
                            )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
