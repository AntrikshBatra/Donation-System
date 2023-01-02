import 'package:donate/screens/home_screen.dart';
import 'package:donate/utils/colors.dart';
import 'package:flutter/material.dart';

backButtonDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: primaryColor,
          title: const Icon(
            Icons.warning,
            color: Colors.white,
            size: 30,
          ),
          content: const Text(
            'The Information on this page will not be saved if you exit this screen.Are you sure you want to go back?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 27,
                      width: 38,
                      decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      child: const Center(child: Text('No')),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => const HomePage(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(
                                    opacity: anim,
                                    child: child,
                                  ),
                              transitionDuration:
                                  const Duration(milliseconds: 250)));
                    },
                    child: Container(
                      height: 27,
                      width: 38,
                      decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      child: const Center(child: Text('Yes')),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      });
}
