import 'dart:ui';

import 'package:donate/provider/token.dart';
import 'package:donate/screens/login_screen.dart';
import 'package:donate/widgets/cards.dart';
import 'package:donate/widgets/drawer.dart';
import 'package:donate/widgets/money_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colors.dart';
import '../widgets/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.getString('AuthToken');
      // DataManagement.getStoredData('AuthToken');
      DataManagement.getStoredData('username');
      DataManagement.getStoredData('email');
      if (DataManagement.name != '') {
        setState(() {
          DataManagement.logIn = true;
        });
        
      }
      DataManagement.getStoredData('AuthToken');

      print("${DataManagement.token}lllllllllllllllllll");
    });
  }

  final instance = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Donate'),
          backgroundColor: primaryColor,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 10, 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            side: BorderSide(color: commonBg)))),
                onPressed: () async {
                  if (DataManagement.token != '') {
                    setState(() {
                      DataManagement.clear('AuthToken');
                      DataManagement.clear('username');
                      DataManagement.clear('email');
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logging out....')));
                  }
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => const LoginScreen(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(
                                opacity: anim,
                                child: child,
                              ),
                          transitionDuration:
                              const Duration(milliseconds: 250)));
                },
                child: DataManagement.email!=''
                    ? const Text(
                        "Logout",
                        style: TextStyle(
                            color: commonBg,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                            color: commonBg,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 2)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 20,
                width: double.infinity,
                color: secondaryColor,
                padding: const EdgeInsets.only(top: 1),
                child: const Center(
                    child: Text(
                  'A STEP TO IMPROVE THE LIVES OF PEOPLE',
                  style: TextStyle(color: Colors.black87),
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 14),
                child: Carousel(),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      gradient: const LinearGradient(
                          colors: [Colors.blueAccent, Colors.blueGrey],
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          stops: [1, 1]),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '"Alone We Can Do So Little, Together We Can Do So Much"',
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        style: TextStyle(color: commonBg, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DataManagement.token != ''
                  ? Container()
                  : ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color?>(primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                      child: Text(
                        'JOIN US?',
                        style: TextStyle(
                            color: commonBg, backgroundColor: primaryColor),
                      ),
                    ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Text(
                    'YOU CAN DONATE IN FOLLOWING CATEGORIES',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      MyCard(
                          text: 'FOOTWEAR',
                          image:
                              'https://static.businessworld.in/article/article_extra_large_image/1560859917_Yqz5H0_sneaker2_470.jpg'),
                      MyCard(
                          text: 'CLOTHES',
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEkuve-TSN96zNzJE5uZ4-yAuMTXeWIirF7Q&usqp=CAU'),
                    ]),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: const [
              //     MyCard(
              //       text: 'BOOKS',
              //       image:
              //           'https://5.imimg.com/data5/JY/BK/MY-4770102/school-books-500x500.jpg',
              //     ),
              //     MyCard(
              //         text: 'Coming Soon',
              //         image:
              //             'https://img.freepik.com/premium-vector/progress-bar-doodle-sketch-style-loading-icon-image-hand-drawn-vector-illustration_356415-1238.jpg?w=2000')
              //     //moneyCard()
              //   ],
              // ),
              const Divider(
                thickness: 2,
              ),
              const Center(
                child: Text(
                  'SHOUT OUT SECTION',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 0, 5),
                    child: Container(
                      height: 80,
                      width: 165,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.blueAccent, Colors.blueGrey],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              stops: [1, 1]),
                          color: primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 7, right: 5, left: 5),
                        child: Text(
                          '"Ayush from Delhi donated 8 pair of shoes"',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: commonBg),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 5),
                    child: Container(
                      height: 80,
                      width: 165,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.blueAccent, Colors.blueGrey],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              stops: [1, 1]),
                          color: primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: Text(
                          '"Next Shoutout can be yours.Donate to improve lives of people"',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: commonBg),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 0, 5),
                    child: Container(
                      height: 80,
                      width: 165,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.blueAccent, Colors.blueGrey],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              stops: [1, 1]),
                          color: primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 7, right: 5, left: 5),
                        child: Text(
                          '"Ayush from Delhi donated 8 pair of shoes"',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: commonBg),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 5),
                    child: Container(
                      height: 80,
                      width: 165,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.blueAccent, Colors.blueGrey],
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              stops: [1, 1]),
                          color: primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: Text(
                          '"Next Shoutout can be yours.Donate to improve lives of people"',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: commonBg),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        drawer: const SafeArea(child: MyDrawer()),
      ),
    );
  }
}
