import 'package:donate/provider/token.dart';
import 'package:donate/screens/make_donation_screen.dart';
import 'package:donate/utils/colors.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: InkWell(
        onTap: () {
          if (DataManagement.token == '') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Please Login to Continue to Donate')));
          } else {
            !text.contains('Coming')
                ? Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            MakeDonationScreen(itemType: text),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                        transitionDuration: const Duration(milliseconds: 250)))
                : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('More Categories are on the way....')));
          }
        },
        child: Card(
          elevation: 4,
          shadowColor: secondaryColor,
          margin: const EdgeInsets.fromLTRB(0, 0, 4, 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.blueAccent, Colors.blueGrey],
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                            stops: [1, 1]),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        color: primaryColor),
                    height: 30,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: commonBg,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
