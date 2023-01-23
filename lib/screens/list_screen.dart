import 'dart:typed_data';
import 'dart:ui';

import 'package:donate/model/item.dart';
import 'package:donate/provider/getItemDetails.dart';
import 'package:donate/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_description.dart';

class BoxItems extends StatelessWidget {
  const BoxItems({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Consumer<DonationItems>(builder: ((context, value, child) {
            value.getDonationDetails(context);
            return Column(
              children: [
                Container(
                  color: secondaryColor,
                  height: 20,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'A STEP TO IMPROVE THE LIVES OF PEOPLE',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Items Added Till Now',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: ShapeDecoration(
                      color: primaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  height: 39,
                  width: 352,
                  child: Padding(
                    padding: EdgeInsets.only(top: 7, left: 6),
                    child: Text(
                      'Footwear (${ItemTypeList.footwear.length})',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0.3,
                ),
                Container(
                    height: 250,
                    width: 350,
                    decoration: const ShapeDecoration(
                        color: Colors.cyan,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                    child: ItemTypeList.footwear.length == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  CupertinoIcons.timer_fill,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text('Waiting for items in this category...')
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: ItemTypeList.footwear.length,
                            itemBuilder: (BuildContext context, int index) {
                              // print(ItemTypeList.footwear[index].photo);
                              // print('88888888888&******************');
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (c, a1, a2) =>
                                              ItemDescription(
                                                image: ItemTypeList
                                                    .footwear[index].photo,
                                                description: ItemTypeList
                                                    .footwear[index]
                                                    .description,
                                                title: ItemTypeList
                                                    .footwear[index].title,
                                                userType: 'User',
                                              ),
                                          transitionsBuilder:
                                              (c, anim, a2, child) =>
                                                  FadeTransition(
                                                    opacity: anim,
                                                    child: child,
                                                  ),
                                          transitionDuration: const Duration(
                                              milliseconds: 250)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Container(
                                    height: 45,
                                    width: 345,
                                    padding: EdgeInsets.only(left: 5),
                                    decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '${index + 1}',
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: SizedBox(
                                            width: 30,
                                            child: Text(
                                              '${ItemTypeList.footwear[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 25, right: 70),
                                          child: Text(
                                            'In Progress',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                        Container(
                                          height: 33,
                                          width: 30,
                                          decoration: BoxDecoration(),
                                          child: Image.asset(
                                            'Backened/uploads/${ItemTypeList.footwear[index].photo}',
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: ShapeDecoration(
                      color: primaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  height: 39,
                  width: 352,
                  child: Padding(
                    padding: EdgeInsets.only(top: 7, left: 6),
                    child: Text(
                      'Clothes (${ItemTypeList.clothes.length})',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0.3,
                ),
                Container(
                    height: 250,
                    width: 350,
                    decoration: const ShapeDecoration(
                        color: Colors.cyan,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                    child: ItemTypeList.clothes.length == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  CupertinoIcons.timer_fill,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text('Waiting for items in this category...')
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: ItemTypeList.clothes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (c, a1, a2) =>
                                              ItemDescription(
                                                image: ItemTypeList
                                                    .clothes[index].photo,
                                                description: ItemTypeList
                                                    .clothes[index]
                                                    .description,
                                                title: ItemTypeList
                                                    .clothes[index].title,
                                                userType: 'User',
                                              ),
                                          transitionsBuilder:
                                              (c, anim, a2, child) =>
                                                  FadeTransition(
                                                    opacity: anim,
                                                    child: child,
                                                  ),
                                          transitionDuration: const Duration(
                                              milliseconds: 250)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Container(
                                    height: 45,
                                    width: 345,
                                    padding: EdgeInsets.only(left: 5),
                                    decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '${index + 1}',
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: SizedBox(
                                            width: 30,
                                            child: Text(
                                              '${ItemTypeList.clothes[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 25, right: 70),
                                          child: Text(
                                            'In Progress',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                              height: 33,
                                              width: 30,
                                              decoration: BoxDecoration(),
                                              child: Image.asset(
                                                  'Backened/uploads/${ItemTypeList.clothes[index].photo}')),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //   decoration: ShapeDecoration(
                //       color: primaryColor,
                //       shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(8)))),
                //   height: 39,
                //   width: 352,
                //   child: const Padding(
                //     padding: EdgeInsets.only(top: 7, left: 6),
                //     child: Text(
                //       'Books',
                //       style: TextStyle(color: Colors.white, fontSize: 20),
                //       textAlign: TextAlign.left,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 0.3,
                // ),
                // Container(
                //     height: 250,
                //     width: 350,
                //     decoration: const ShapeDecoration(
                //         color: Colors.cyan,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.all(Radius.circular(6)))),
                //     child: ItemTypeList.books.length == 0
                //         ? Center(
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: const [
                //                 Icon(
                //                   CupertinoIcons.timer_fill,
                //                   color: Colors.white,
                //                   size: 40,
                //                 ),
                //                 SizedBox(
                //                   height: 3,
                //                 ),
                //                 Text('Waiting for items in this category...')
                //               ],
                //             ),
                //           )
                //         : ListView.builder(
                //             itemCount: ItemTypeList.books.length,
                //             itemBuilder: (BuildContext context, int index) {
                //               return Padding(
                //                 padding: const EdgeInsets.only(top: 3),
                //                 child: Container(
                //                   height: 45,
                //                   width: 345,
                //                   padding: EdgeInsets.only(left: 5),
                //                   decoration: const ShapeDecoration(
                //                       color: Colors.white,
                //                       shape: RoundedRectangleBorder(
                //                           borderRadius:
                //                               BorderRadius.all(Radius.circular(5)))),
                //                   child: Row(
                //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                     children: [
                //                       Text(
                //                         '${index + 1}',
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.only(left: 8),
                //                         child: Text(
                //                           '${ItemTypeList.books[index].title}',
                //                         ),
                //                       ),
                //                       const Padding(
                //                         padding: EdgeInsets.only(left: 25, right: 70),
                //                         child: Text(
                //                           'In Progress',
                //                           style: TextStyle(color: Colors.green),
                //                         ),
                //                       ),
                //                       Container(
                //                         height: 33,
                //                         width: 30,
                //                         decoration: BoxDecoration(
                //                             image: DecorationImage(
                //                                 image: MemoryImage(
                //                                     ItemTypeList.books[index].photo),
                //                                 fit: BoxFit.fill)),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               );
                //             })),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          })),
        ));
  }
}
