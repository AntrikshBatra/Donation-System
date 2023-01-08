import 'package:donate/provider/token.dart';
import 'package:donate/provider/usernameProvider.dart';
import 'package:donate/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ngo_home_screen.dart';

class selectScreen extends StatefulWidget {
  const selectScreen({super.key});

  @override
  State<selectScreen> createState() => _selectScreenState();
}

class _selectScreenState extends State<selectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      DataManagement.getStoredData('userType');
    });
  }

  @override
  Widget build(BuildContext context) {
    var type = Provider.of<UsernameProvider>(context, listen: true);
    type.getUserType();
    if (type.userType=='NGO') {
      return NgoHomeScreen();
    }
    return HomePage();
  }
}
