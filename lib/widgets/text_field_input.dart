import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool password;
  final String hintText;
  final FormFieldValidator? validate;
  final TextInputType type;
  const TextFieldInput(
      {Key? key,
      required this.controller,
      required this.password,
      required this.hintText,
      required this.type,
      required this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return SizedBox(
      width: double.infinity,
      // height: 50,
      child: TextFormField(
        validator: validate,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          iconColor: Colors.grey,
          focusColor: Colors.white,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        keyboardType: type,
        obscureText: password,
      ),
    );
  }
}
