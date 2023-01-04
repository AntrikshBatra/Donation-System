import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class DataManagement {
  static String token = '';
  static String name = '';
  static String email = '';
  static String userType = '';
  static bool logIn = false;
  static storeData(String key, String value) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString(key, value);
    token = value;
    if (key == 'username') {
      name = value;
    } else if (key == 'email') {
      email = value;
    } else if (key == 'AuthToken') {
      token = value;
      logIn = true;
    } else if (key == 'userType') {
      userType = value;
    }
    print('kkkkkkkkkkkkkkkkkk');
  }

  static getStoredData(String key) async {
    final instance = await SharedPreferences.getInstance();
    String? value = instance.getString(key);
    if (value == null) {
      token = '';
      name = '';
      email = '';
      logIn = false;
    } else if (key == 'username') {
      name = value;
      print('1111rrrr');
    } else if (key == 'email') {
      email = value;
    } else if (key == 'AuthToken') {
      logIn = true;
      token = value;
    } else if (key == 'userType') {
      userType = value;
    }
    print('$value----------');

    return value;
  }

  static clear(String key) async {
    final instance = await SharedPreferences.getInstance();
    print('${instance.getString('AuthToken')}/////');
    instance.remove('AuthToken');
    instance.remove('username');
    instance.remove('email');
    instance.remove('userType');
    token = '';
    name = '';
    email = '';
    logIn = false;
    userType = '';
    //instance.clear();
    print('${instance.getString('AuthToken')}/////');
  }
}
