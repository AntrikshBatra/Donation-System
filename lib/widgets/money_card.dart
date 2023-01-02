import 'package:donate/screens/money_donation_screen.dart';
import 'package:donate/utils/colors.dart';
import 'package:flutter/material.dart';

class moneyCard extends StatelessWidget {
  const moneyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const moneyDonationScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                        opacity: anim,
                        child: child,
                      ),
                  transitionDuration: const Duration(milliseconds: 250)));
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
              const Center(
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 45),
                    child: Image(
                      image: NetworkImage(
                          'https://thumbs.dreamstime.com/z/donate-money-to-charity-concept-vector-illustration-53450878.jpg'),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        color: primaryColor),
                    height: 30,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        'MONEY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
