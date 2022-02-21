import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class log_in_page extends StatefulWidget {
  @override
  State<log_in_page> createState() => _log_in_pageState();
}

class _log_in_pageState extends State<log_in_page> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHomePage(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() async {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        //color: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                            validator: (value) {
                              if (value!.isEmpty)
                                return ("Username cannot be empty");
                              return null;
                            },
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Password cannot be empty");
                              } else if (value.length < 6)
                                return ("Password length should be atleast six ");
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Material(
                            child: InkWell(
                                splashColor: Colors.red,
                                onTap: () => moveToHomePage(context),
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
                                )),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
