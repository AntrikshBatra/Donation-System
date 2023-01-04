import 'package:donate/provider/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameProvider extends ChangeNotifier {
  String? authtoken = '';
  void GetUsername() async {
    final instance = await SharedPreferences.getInstance();
    authtoken = instance.getString('AuthToken');
    notifyListeners();
  }

  void RemoveUsername() async {
    authtoken = '';
    notifyListeners();
  }
}
