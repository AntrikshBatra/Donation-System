import 'package:donate/provider/usernameProvider.dart';
import 'package:donate/screens/ngo_list_screen.dart';
import 'package:donate/screens/usertype.dart';
import 'package:donate/widgets/Ngo_drawer.dart';
import 'package:donate/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/token.dart';
import '../utils/colors.dart';
import '../widgets/cards.dart';
import '../widgets/drawer.dart';

class NgoHomeScreen extends StatefulWidget {
  const NgoHomeScreen({super.key});

  @override
  State<NgoHomeScreen> createState() => _NgoHomeScreenState();
}

class _NgoHomeScreenState extends State<NgoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Consumer<UsernameProvider>(
          builder: ((context, value, child) {
            value.GetUsername;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Donate'),
                backgroundColor: Colors.purple,
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 10, 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color?>(
                              Colors.deepPurpleAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                      side: BorderSide(color: commonBg)))),
                      onPressed: () async {
                        if (DataManagement.token != '') {
                          setState(() {
                            DataManagement.clear('AuthToken');
                            DataManagement.clear('username');
                            DataManagement.clear('email');
                            DataManagement.clear('userType');
                            value.authtoken = '';
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Logging out....')));
                        }
                        value.RemoveUsername();
                        value.RemoveUserType();
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const userType(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(
                                      opacity: anim,
                                      child: child,
                                    ),
                                transitionDuration:
                                    const Duration(milliseconds: 250)));
                      },
                      child: value.authtoken != '' && value.authtoken != null
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
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.indigoAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [1, 1]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '"Happiness doesn’t result from what we get, but from what we give"',
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
                    const Divider(thickness: 2),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: Text(
                          'Donation Section',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: const [
                    //         MyCard(
                    //             text: 'FOOTWEAR',
                    //             image:
                    //                 'https://static.businessworld.in/article/article_extra_large_image/1560859917_Yqz5H0_sneaker2_470.jpg'),
                    //         MyCard(
                    //             text: 'CLOTHES',
                    //             image:
                    //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEkuve-TSN96zNzJE5uZ4-yAuMTXeWIirF7Q&usqp=CAU'),
                    //       ]),
                    // ),
                    // const Divider(
                    //   thickness: 2,
                    // ),
                    // const Center(
                    //   child: Text(
                    //     'SHOUT OUT SECTION',
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(8, 4, 0, 5),
                    //       child: Container(
                    //         height: 80,
                    //         width: 165,
                    //         decoration: BoxDecoration(
                    //             gradient: const LinearGradient(
                    //                 colors: [Colors.blueAccent, Colors.blueGrey],
                    //                 begin: Alignment.centerLeft,
                    //                 end: Alignment.bottomRight,
                    //                 stops: [1, 1]),
                    //             color: primaryColor,
                    //             borderRadius: const BorderRadius.only(
                    //                 topLeft: Radius.circular(10),
                    //                 bottomRight: Radius.circular(10))),
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(top: 7, right: 5, left: 5),
                    //           child: Text(
                    //             '"Ayush from Delhi donated 8 pair of shoes"',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(color: commonBg),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(2, 2, 8, 5),
                    //       child: Container(
                    //         height: 80,
                    //         width: 165,
                    //         decoration: BoxDecoration(
                    //             gradient: const LinearGradient(
                    //                 colors: [Colors.blueAccent, Colors.blueGrey],
                    //                 begin: Alignment.centerLeft,
                    //                 end: Alignment.bottomRight,
                    //                 stops: [1, 1]),
                    //             color: primaryColor,
                    //             borderRadius: const BorderRadius.only(
                    //                 topLeft: Radius.circular(10),
                    //                 bottomRight: Radius.circular(10))),
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                    //           child: Text(
                    //             '"Next Shoutout can be yours.Donate to improve lives of people"',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(color: commonBg),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(8, 4, 0, 5),
                    //       child: Container(
                    //         height: 80,
                    //         width: 165,
                    //         decoration: BoxDecoration(
                    //             gradient: const LinearGradient(
                    //                 colors: [Colors.blueAccent, Colors.blueGrey],
                    //                 begin: Alignment.centerLeft,
                    //                 end: Alignment.bottomRight,
                    //                 stops: [1, 1]),
                    //             color: primaryColor,
                    //             borderRadius: const BorderRadius.only(
                    //                 topLeft: Radius.circular(10),
                    //                 bottomRight: Radius.circular(10))),
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(top: 7, right: 5, left: 5),
                    //           child: Text(
                    //             '"Ayush from Delhi donated 8 pair of shoes"',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(color: commonBg),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(2, 2, 8, 5),
                    //       child: Container(
                    //         height: 80,
                    //         width: 165,
                    //         decoration: BoxDecoration(
                    //             gradient: const LinearGradient(
                    //                 colors: [Colors.blueAccent, Colors.blueGrey],
                    //                 begin: Alignment.centerLeft,
                    //                 end: Alignment.bottomRight,
                    //                 stops: [1, 1]),
                    //             color: primaryColor,
                    //             borderRadius: const BorderRadius.only(
                    //                 topLeft: Radius.circular(10),
                    //                 bottomRight: Radius.circular(10))),
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                    //           child: Text(
                    //             '"Next Shoutout can be yours.Donate to improve lives of people"',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(color: commonBg),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )

                    InkWell(
                      onTap: (){
                         Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const NGOListScreen(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(
                                      opacity: anim,
                                      child: child,
                                    ),
                                transitionDuration:
                                    const Duration(milliseconds: 250)));
                      },
                      child: Container(
                        height: 130,
                        width: 340,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.indigoAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Text(
                            'REQUESTS',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              drawer: const SafeArea(child: NGODrawer()),
            );
          }),
        ));
  }
}
