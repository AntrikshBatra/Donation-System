import 'package:donate/provider/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameProvider extends ChangeNotifier {
  String? authtoken = '';
  String? userType = '';
  void GetUsername() async {
    final instance = await SharedPreferences.getInstance();
    authtoken = instance.getString('AuthToken');
    notifyListeners();
  }

  void RemoveUsername() async {
    authtoken = '';
    notifyListeners();
  }

  void getUserType() async {
    final insatnce = await SharedPreferences.getInstance();
    userType = insatnce.getString('userType');
  }

  void RemoveUserType() async {
    userType = '';
    notifyListeners();
  }
}
