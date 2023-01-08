import 'dart:convert';

import 'package:donate/apis/login.dart';
import 'package:donate/model/item.dart';
import 'package:donate/provider/token.dart';
import 'package:donate/widgets/make_donationWidgets/add_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DonationItems extends ChangeNotifier {
  bool _isLoading = false;

  Future getDonationDetails(BuildContext context) async {
    http.Response response = await http.get(
        Uri.parse("$base/api/details/fetchalldetails"),
        headers: <String, String>{
          'Accept': '*/*',
          'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
          'Content-Type': 'application/json',
          'auth-token': DataManagement.token
        });

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(jsonDecode(response.body));
      print('hhhhhhhhhhh');
      print(response);
      ItemTypeList.footwear.clear();
      ItemTypeList.clothes.clear();
      for (var donation in json.decode(response.body)) {
        if (donation["category"].toString() == 'shoes')
          addItemToList(context, donation["image"], donation["title"],
              donation["description"], 'footwear');
        else {
          addItemToList(context, donation["image"], donation["title"],
              donation["description"], 'clothes');
        }
      }
      print('33333333333333333333');
      print(ItemTypeList.footwear.length);
    } else {
      print('hhhhhhhhhhhhh1111111111');
      print('${jsonDecode(response.body)}---------------------kk');
      //throw Exception(json.decode(response.body));
    }
    notifyListeners();
  }
}
