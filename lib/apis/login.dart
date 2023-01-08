import 'dart:convert';

import 'package:http/http.dart' as http;

String base = 'http://:5000';
Future SignupRequest(String name, String email, String password) async {
  final map = jsonEncode({'name': name, 'email': email, 'password': password});

  print(map);

  http.Response response = await http.post(
    Uri.parse("$base/api/auth/createuser"),
    headers: <String, String>{
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json'
    },
    body: map,
  );
  //     .timeout(
  //   const Duration(seconds: 10),
  //   onTimeout: () {
  //      http.Response('Error', 408);
  //   },
  // );
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

Future LoginRequest(String email, String password) async {
  final map = jsonEncode({'email': email, 'password': password});

  print(map);

  http.Response response = await http.post(
    Uri.parse("$base/api/auth/login"),
    headers: <String, String>{
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json'
    },
    body: map,
  );
  //     .timeout(
  //   const Duration(seconds: 10),
  //   onTimeout: () {
  //      http.Response('Error', 408);
  //   },
  // );
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

Future getUsername(String value) async {
  http.Response response = await http
      .get(Uri.parse("$base/api/auth/getuser"), headers: <String, String>{
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Content-Type': 'application/json',
    'auth-token': value
  });

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

Future NgoSignupRequest(
    String name, String email, String password, String registration) async {
  final map = jsonEncode({
    'name': name,
    'email': email,
    'password': password,
    'registration': registration
  });

  print(map);

  http.Response response = await http.post(
    Uri.parse("$base/api/ngo/createuser"),
    headers: <String, String>{
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json'
    },
    body: map,
  );

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
Future getNGOUsername(String value) async {
  http.Response response = await http.get(
      Uri.parse("$base/api/ngo/getngo"),
      headers: <String, String>{
        'Accept': '*/*',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Content-Type': 'application/json',
        'auth-token': value
      });

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

Future NgoLoginRequest(String email, String password) async {
  final map = jsonEncode({'email': email, 'password': password});

  print(map);

  http.Response response = await http.post(
    Uri.parse("$base/api/ngo/login"),
    headers: <String, String>{
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json'
    },
    body: map,
  );

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
