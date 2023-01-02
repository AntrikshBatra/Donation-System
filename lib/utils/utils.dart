import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source, BuildContext context) async {
  final ImagePicker _picker = ImagePicker();

  XFile? _file = await _picker.pickImage(source: source);

  if (_file != null) {
    print(_file);
  print('nnnnnnnnnnnnnnnnnnnn');
    return await _file.readAsBytes();
  }
  print(_file.toString());
  print('nnnnnnnnnnnnnnnnnnnn');
  return showSnackBar('No Image was selected!', context);
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
