import 'package:donate/screens/ngo_home_screen.dart';
import 'package:donate/screens/ngo_login_screen.dart';
import 'package:flutter/material.dart';

import '../apis/login.dart';
import '../provider/token.dart';
import '../utils/colors.dart';
import '../widgets/text_field_input.dart';

class NgoSignupScreen extends StatefulWidget {
  const NgoSignupScreen({super.key});

  @override
  State<NgoSignupScreen> createState() => _NgoSignupScreenState();
}

class _NgoSignupScreenState extends State<NgoSignupScreen> {
  static final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                  child: Column(children: [
                    const SizedBox(
                      height: 40,
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
                    const SizedBox(height: 10),
                    TextFieldInput(
                        validate: (value) => value.toString().isEmpty
                            ? "Enter Username"
                            : value.toString().length < 5
                                ? "Minimum Length is 5"
                                : null,
                        controller: _nameController,
                        password: false,
                        hintText: "Enter Username...",
                        type: TextInputType.emailAddress),
                    const SizedBox(height: 10),
                    TextFieldInput(
                        controller: _registrationController,
                        password: false,
                        hintText: "Enter Registration Number Issued By Govt.",
                        type: TextInputType.text,
                        validate: (value) => value.toString().isEmpty
                            ? "Enter Registration Number"
                            : value.toString().length != 16
                                ? "Enter Valid Registration Number"
                                : null),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldInput(
                        validate: (value) => value.toString().isEmpty
                            ? "Enter Password"
                            : value.toString().length < 8
                                ? "Minimum Length of password should be 8"
                                : null,
                        controller: _passwordController,
                        password: true,
                        hintText: "Enter Your Password...",
                        type: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldInput(
                        validate: (value) => value.toString().isEmpty
                            ? "Confirm your password"
                            : value.toString().length < 8
                                ? "Minimum Length of password should be 8"
                                : value.toString() != _passwordController.text
                                    ? "Password does not match"
                                    : null,
                        controller: _confirmPasswordController,
                        password: true,
                        hintText: "Confirm Password",
                        type: TextInputType.text),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        print('hello NGO');
                        if (_isLoading == true) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Please Wait.Signup already in Progress...')));
                        } else {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            final responseDataCollection =
                                await NgoSignupRequest(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                    _registrationController.text);

                            print(
                                '${responseDataCollection.toString()}---------');

                            if (responseDataCollection["authtoken"] == null) {
                              setState(() {
                                _isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          responseDataCollection["error"]
                                              .toString())));
                            } else {
                              String value = responseDataCollection["authtoken"]
                                  .toString();
                              DataManagement.storeData('AuthToken', value);
                              DataManagement.storeData(
                                  'username', _nameController.text);
                              DataManagement.storeData(
                                  'email', _emailController.text);
                              DataManagement.storeData('userType', 'NGO');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Login Successful')));
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const NgoHomeScreen())),
                                  (route) => false);
                            }
                          }
                        }
                      },
                      child: Container(
                        height: 42,
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) =>
                                        const NgoLoginScreen(),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(
                                          opacity: anim,
                                          child: child,
                                        ),
                                    transitionDuration:
                                        const Duration(milliseconds: 250)));
                          },
                          child: const Text(
                            "Already a user? Login",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ]),
                )),
          ),
        ));
  }
}
