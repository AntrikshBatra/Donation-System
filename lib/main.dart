import 'package:donate/provider/getItemDetails.dart';
import 'package:donate/provider/token.dart';
import 'package:donate/provider/usernameProvider.dart';
import 'package:donate/screens/home_screen.dart';
import 'package:donate/screens/ngo_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  // DataManagement.getStoredData('AuthToken');
  WidgetsBinding.instance.addPostFrameCallback((_) {
    DataManagement.getStoredData("userType");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DonationItems()),
        ChangeNotifierProvider(create: (_) => UsernameProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Donation App',
        theme: ThemeData.light(),
        home: DataManagement.userType == 'NGO'
            ? const NgoHomeScreen()
            : const HomePage(),
      ),
    );
  }
}
