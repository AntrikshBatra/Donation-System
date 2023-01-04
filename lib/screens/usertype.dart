import 'dart:ui';

import 'package:donate/widgets/cards.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class userType extends StatefulWidget {
  const userType({super.key});

  @override
  State<userType> createState() => _userTypeState();
}

class _userTypeState extends State<userType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Donate'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGIN AS...",
              style: TextStyle(fontSize: 35),

            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MyCard(
                    text: "USER",
                    image:
                        "https://e7.pngegg.com/pngimages/384/706/png-clipart-computer-icons-user-login-gender-miscellaneous-desktop-wallpaper-thumbnail.png"),
                MyCard(
                    text: "NGO",
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSosFA25lhPUbTi_sS6rT_cmtc8ep5G-BpbQ&usqp=CAU")
              ],
            )
          ],
        ),
      ),
    );
  }
}
