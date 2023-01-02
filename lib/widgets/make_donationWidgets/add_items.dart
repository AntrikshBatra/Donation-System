import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../model/item.dart';

addItemToList(BuildContext context, String file, String title,
    String description, String type) {
  String itemType = type;
  Item item = Item(photo: 'String', title: title, description: description);

  if (itemType == 'footwear') {
    ItemTypeList.footwear.add(item);
  } else if (itemType == 'clothes') {
    ItemTypeList.clothes.add(item);
  }
}
