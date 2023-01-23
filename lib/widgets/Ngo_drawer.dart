import 'package:donate/provider/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/ngo_list_screen.dart';

class NGODrawer extends StatefulWidget {
  const NGODrawer({super.key});

  @override
  State<NGODrawer> createState() => _NGODrawerState();
}

class _NGODrawerState extends State<NGODrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.purpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                margin: EdgeInsets.zero,
                accountName: DataManagement.name != ''
                    ? Text(DataManagement.name)
                    : const Text('Username'),
                accountEmail: DataManagement.email != ''
                    ? Text(DataManagement.email)
                    : const Text('abc@email.com'),
              )),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => const NGOListScreen(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(
                            opacity: anim,
                            child: child,
                          ),
                      transitionDuration: const Duration(milliseconds: 250)));
            },
            leading: const Icon(
              Icons.pending_actions,
              size: 25,
              color: Colors.pink,
            ),
            title: const Text(
              'Requests',
              textScaleFactor: 1.14,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.help,
              size: 25,
              color: Colors.pink,
            ),
            title: const Text(
              'Help',
              textScaleFactor: 1.14,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.info,
              size: 25,
              color: Colors.pink,
            ),
            title: const Text(
              'About Us',
              textScaleFactor: 1.14,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
