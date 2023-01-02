import 'package:donate/apis/login.dart';
import 'package:donate/screens/signup_screen.dart';
import 'package:donate/utils/colors.dart';
import 'package:donate/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

import '../provider/token.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                    width: double.infinity,
                    height: 190,
                    child: Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKljucJzmGmp6VOhiF2Gtjjk7-zh8ff-f8ZQ&usqp=CAU'),
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
                      final responseDataCollection = await LoginRequest(
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
                        DataManagement.storeData('AuthToken', value);
                        DataManagement.storeData(
                            'email', _emailController.text);
                        print('----------------------------');
                        final usernameResponse = await getUsername(value);
                        if (usernameResponse['error'] != null) {
                          DataManagement.clear("AuthToken");
                          DataManagement.clear("username");
                          DataManagement.clear('email');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Something Went Wrong. Try Again Later')));
                        } else {
                          print(usernameResponse);
                          print('bbbbbbbbbbbbbbbbbbbb');
                          print(usernameResponse["name"].toString());
                          String userrname = usernameResponse["name"].toString();
                          setState(() {
                            DataManagement.storeData('username', userrname);
                            _isLoading = false;
                          });
                        }
                        // setState(() {
                        //   _isLoading = false;
                        // });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login Successful')));

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: ((context) => HomePage())),
                            (route) => false);
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
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (c, a1, a2) =>
                                    const SignupScreen(),
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
