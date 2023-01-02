import 'package:donate/provider/token.dart';
import 'package:donate/screens/list_screen.dart';
import 'package:donate/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.blueGrey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            margin: EdgeInsets.zero,
            accountName: DataManagement.name != ''
                ? Text(DataManagement.name)
                : Text('Username'),
            accountEmail: DataManagement.email != ''
                ? Text(DataManagement.email)
                : Text('abc@email.com'),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => const BoxItems(),
                    transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                          opacity: anim,
                          child: child,
                        ),
                    transitionDuration: const Duration(milliseconds: 250)));
          },
          leading: Icon(
            CupertinoIcons.gift_fill,
            color: primaryColor,
            size: 25,
          ),
          title: const Text(
            "Your Current Box",
            textScaleFactor: 1.14,
            style: TextStyle(color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.heart_circle_fill,
            color: primaryColor,
            size: 25,
          ),
          title: const Text(
            "Donation History",
            textScaleFactor: 1.14,
            style: TextStyle(color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.location_solid,
            color: primaryColor,
            size: 25,
          ),
          title: const Text(
            "Track Your Box",
            textScaleFactor: 1.14,
            style: TextStyle(color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: primaryColor,
            size: 25,
          ),
          title: const Text(
            "Profile Settings",
            textScaleFactor: 1.14,
            style: TextStyle(color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.help,
            color: primaryColor,
            size: 25,
          ),
          title: const Text(
            "Help",
            textScaleFactor: 1.14,
            style: TextStyle(color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.info,
            color: primaryColor,
            size: 25,
          ),
          title: const Text(
            "About Us",
            textScaleFactor: 1.14,
            style: TextStyle(color: Colors.black),
          ),
        )
      ]),
    );
  }
}
