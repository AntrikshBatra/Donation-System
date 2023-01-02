import 'dart:typed_data';

import 'package:flutter/material.dart';

class ItemTypeList {
  static List<Item> footwear = [];

  static List<Item> clothes = [];

  static int total = footwear.length + clothes.length;
}

class Item {
  final String photo;
  final String title;
  final String description;

  Item({required this.photo, required this.title, required this.description});
}

// class Footwear {
//   final Uint8List photo;
//   final String title;
//   final String description;

//   Footwear(
//       {required this.photo, required this.title, required this.description});
// }

// class Books {
//   final Uint8List photo;
//   final String title;
//   final String description;

//   Books({required this.photo, required this.title, required this.description});
// }

// class Food {
//   final Uint8List photo;
//   final String title;
//   final String description;

//   Food({required this.photo, required this.title, required this.description});
// }

// class Clothes {
//   final Uint8List photo;
//   final String title;
//   final String description;

//   Clothes(
//       {required this.photo, required this.title, required this.description});
// }
