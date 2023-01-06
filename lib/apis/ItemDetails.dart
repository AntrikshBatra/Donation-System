import 'dart:convert';

import 'package:donate/provider/token.dart';
import 'package:http/http.dart' as http;

Future itemDetails(String title, String description, String ngo, String image,
    String itemType) async {
  final map = jsonEncode({
    'title': title,
    'description': description,
    'ngo_link': ngo,
    'image': image
  });
  print(map);
  http.Response response = await http.post(
    Uri.parse("http://192.168.80.37:5000/api/details/adddetail/$itemType"),
    headers: <String, String>{
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'auth-token': DataManagement.token
    },
    body: map,
  );
  //header m token daalna h....
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(jsonDecode(response.body));
    print('hhhhhhhhhhh');
    return jsonDecode(response.body);
  } else {
    print('hhhhhhhhhhhhh1111111111');
    print('${jsonDecode(response.body)}---------------------kk');
    return jsonDecode(response.body);

    //throw Exception(json.decode(response.body));
  }
}

Future getitemDetails() async {
  print('getting item details');
  http.Response response = await http.post(
    Uri.parse("http://192.168.80.37:5000/api/details/fetchalldetails"),
    headers: <String, String>{
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'auth-token': DataManagement.token
    },
  );
  //header m token daalna h....
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(jsonDecode(response.body));
    print('hhhhhhhhhhh');
    return jsonDecode(response.body);
  } else {
    print('hhhhhhhhhhhhh1111111111');
    print('${jsonDecode(response.body)}---------------------kk');
    return jsonDecode(response.body);

    //throw Exception(json.decode(response.body));
  }
}
