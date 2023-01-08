import 'package:donate/apis/login.dart';
import 'package:donate/provider/token.dart';
import 'package:donate/screens/ngo_home_screen.dart';
import 'package:donate/screens/ngo_signup_screen.dart';
import 'package:donate/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/text_field_input.dart';

class NgoLoginScreen extends StatefulWidget {
  const NgoLoginScreen({super.key});

  @override
  State<NgoLoginScreen> createState() => _NgoLoginScreenState();
}

class _NgoLoginScreenState extends State<NgoLoginScreen> {
  static final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Donate'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const SizedBox(
                    width: 200,
                    height: 190,
                    child: Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSosFA25lhPUbTi_sS6rT_cmtc8ep5G-BpbQ&usqp=CAU'),
                      fit: BoxFit.fill,
                    )),
                const SizedBox(height: 20),
                TextFieldInput(
                    validate: (value) => value.toString().isEmpty
                        ? "Enter Email"
                        : (emailRegExp.hasMatch(value!)
                            ? null
                            : "Enter valid Email"),
                    controller: _emailController,
                    password: false,
                    hintText: "Enter Your Email...",
                    type: TextInputType.emailAddress),
                const SizedBox(height: 20),
                TextFieldInput(
                    validate: (value) => value.toString().isEmpty
                        ? "Enter Password"
                        : value.toString().length < 8
                            ? "Wrong Password!!"
                            : null,
                    controller: _passwordController,
                    password: true,
                    hintText: "Enter Password...",
                    type: TextInputType.text),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      final responseDataCollection = await NgoLoginRequest(
                          _emailController.text, _passwordController.text);
                      if (responseDataCollection["authtoken"] == null) {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                responseDataCollection["error"].toString())));
                      } else {
                        String value =
                            responseDataCollection["authtoken"].toString();
                        DataManagement.storeData("AuthToken", value);
                        DataManagement.storeData(
                            "email", _emailController.text);
                        print('*************');
                        print(value);
                        print('nnnnnnnnnnnnnnnnnnnnn');
                        final usernameResponse = await getNGOUsername(value);
                        if (usernameResponse['error'] != null) {
                          DataManagement.clear("AuthToken");
                          DataManagement.clear("username");
                          DataManagement.clear('email');
                          print('lllllllllllllllllllllllllllllllllllllllllll');
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Something Went Wrong. Try Again Later')));
                        } else {
                          print(usernameResponse);
                          print('bbbbbbbbbbbbbbbbbbbb');
                          print(usernameResponse["name"].toString());
                          String userrname =
                              usernameResponse["name"].toString();
                          setState(() {
                            DataManagement.storeData('username', userrname);
                            DataManagement.storeData('userType', 'NGO');
                            _isLoading = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Login Successful')));

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) =>
                                      const NgoHomeScreen(),
                                  transitionsBuilder: (c, anim, a2, child) =>
                                      FadeTransition(
                                        opacity: anim,
                                        child: child,
                                      ),
                                  transitionDuration:
                                      const Duration(milliseconds: 250)));
                        }
                      }
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: primaryColor),
                    child: _isLoading
                        ? const Center(
                            child: SizedBox(
                              height: 12,
                              width: 12,
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            ),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // InkWell(
                    //   onTap: () {},
                    //   child: const Text(
                    //     "Forgot Password?",
                    //     style: TextStyle(color: Colors.blue, fontSize: 15),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (c, a1, a2) =>
                                    const NgoSignupScreen(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(
                                      opacity: anim,
                                      child: child,
                                    ),
                                transitionDuration:
                                    const Duration(milliseconds: 250)));
                      },
                      child: const Text(
                        "New User? Signup",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
