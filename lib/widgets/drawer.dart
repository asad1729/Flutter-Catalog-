import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://cdnb.artstation.com/p/assets/images/images/013/364/201/large/ryan-qadri-img-20181011-182405.jpg?1539254081";
    return Drawer(
      child: Container(
        color: Colors.white54,
        child: ListView(children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.limeAccent),
              accountName: Text(
                "Asad Yousuf",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "asadyousuf92@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.black),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          ListTile(
              leading:
                  Icon(CupertinoIcons.profile_circled, color: Colors.black),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.black),
              title: Text("Contact ", style: TextStyle(color: Colors.black)))
        ]),
      ),
    );
  }
}
