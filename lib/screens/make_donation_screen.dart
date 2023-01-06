import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:donate/apis/ItemDetails.dart';
import 'package:donate/model/item.dart';
import 'package:donate/screens/home_screen.dart';
import 'package:donate/screens/list_screen.dart';
import 'package:donate/utils/colors.dart';
import 'package:donate/utils/utils.dart';
import 'package:donate/widgets/make_donationWidgets/add_items.dart';
import 'package:donate/widgets/make_donationWidgets/dialog_boxes/back_button.dart';
import 'package:donate/widgets/text_field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

//final String itemType;
class MakeDonationScreen extends StatefulWidget {
  const MakeDonationScreen({Key? key, required this.itemType})
      : super(key: key);

  final String itemType;

  @override
  State<MakeDonationScreen> createState() => _MakeDonationScreenState();
}

class _MakeDonationScreenState extends State<MakeDonationScreen> {
  getFileName(String itemtype) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('http://192.168.80.37:5000/api/details/adddetail/$itemtype'));
    request.files.add(http.MultipartFile.fromBytes(
        'picture', File(_file!.path).readAsBytesSync(),
        filename: _file!.path));
    var res = await request.send();
    print('________________________-------------');
    print(request.files.asMap());
    return res;
  }

  _addItemToList() {
    print('hhhhhhhhhhhhhhhhhh');
    addItemToList(context, 'in progress', _titleController.text,
        _descriptionController.text, widget.itemType.toLowerCase());
    setState(() {
      ItemTypeList.total =
          ItemTypeList.clothes.length + ItemTypeList.footwear.length;
      print(ItemTypeList.total);
    });
  }

  _changeScreen() {
    showSnackBar(
        'Item added to your current box.You can check progress in Your Current Box Secton.',
        context);

    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (c, a1, a2) => const HomePage(),
            transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                  opacity: anim,
                  child: child,
                ),
            transitionDuration: const Duration(milliseconds: 250)));
  }

  _alertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: primaryColor,
            title: const Icon(
              Icons.warning,
              color: Colors.white,
              size: 30,
            ),
            content: const Text(
              'Once Submitted,You cannot change the details for this Item. Are You Sure You Want to Submit?',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 27,
                        width: 38,
                        decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        child: const Center(child: Text('No')),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        print('2222222222222');
                        // final responseDataColection = {'errors':null};
                        var responseDataColection;
                        var imageResponse;
                        if (widget.itemType.toLowerCase() == 'footwear') {
                          imageResponse = await getFileName('shoes');
                          print('image response doneeeeeeeeeeeeeeeeeeeee');
                          responseDataColection = await itemDetails(
                              _titleController.text,
                              _descriptionController.text,
                              _selectedNGO,
                              'in process',
                              'shoes');
                        } else {
                          imageResponse = await getFileName('clothes');
                          responseDataColection = await itemDetails(
                              _titleController.text,
                              _descriptionController.text,
                              _selectedNGO,
                              'in process',
                              widget.itemType.toLowerCase());
                        }

                        print('1111111111111111');
                        if (responseDataColection["errors"] != null) {
                          print('Something Went Wrong.Try Again Later!!');
                        } else {
                          print('iiiiiiiiiiiiiiinnnnnnnnnnnnnnnnnnnnn');
                          print(responseDataColection);
                          print('222222222222222222222222iiiiiiiiii');
                          _addItemToList();
                          _changeScreen();
                        }
                      },
                      child: Container(
                        height: 27,
                        width: 38,
                        decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        child: const Center(child: Text('Yes')),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  _selectImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: primaryColor,
            title: const Text(
              'Select From..',
              style: TextStyle(color: Colors.white),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(Icons.camera),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text("Camera"),
                        )
                      ],
                    ),
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  dynamic file = await pickImage(ImageSource.camera, context);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(CupertinoIcons.paintbrush),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text("Gallery"),
                        )
                      ],
                    ),
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file =
                      await pickImage(ImageSource.gallery, context);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(Icons.cancel),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text("Cancel"),
                        )
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  dynamic _file;
  bool vis = false;
  bool otherVis = true;
  String _selectedNGO = 'Select NGO*';
  List<String> _ngo = ['Select NGO*', 'ONE', 'TWO', 'THREE', 'FOUR'];

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            backButtonDialog(context);
          },
        ),
        title: Text('Donate'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 8, 8),
            child: Stack(children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const BoxItems(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(
                                  opacity: anim,
                                  child: child,
                                ),
                            transitionDuration:
                                const Duration(milliseconds: 250)));
                  },
                  icon: const Icon(CupertinoIcons.gift_alt_fill)),
              Positioned(
                top: 3,
                right: 10,
                child: Container(
                  height: 10,
                  width: 12,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                ),
              )
              // Positioned(
              //   top: 3,
              //   right: 4,
              //   child: Container(
              //     height: 15,
              //     width: 15,
              //     decoration: const BoxDecoration(
              //         shape: BoxShape.circle, color: Colors.white),
              //     child: Center(
              //       child: Text(
              //         ItemTypeList.total.toString(),
              //         style: TextStyle(color: primaryColor),
              //       ),
              //     ),
              //   ),
              // )
            ]),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 20,
            width: double.infinity,
            color: secondaryColor,
            padding: const EdgeInsets.only(top: 1),
            child: const Center(
                child: Text(
              'A STEP TO IMPROVE THE LIVES OF PEOPLE',
              style: TextStyle(color: Colors.black87),
            )),
          ),
          const SizedBox(
            height: 40,
          ),
          _file != null
              ? Center(
                  child: SizedBox(
                    height: 300,
                    width: 250,
                    child: Container(
                      child: Image.file(File(_file.path)),
                    ),
                  ),
                )
              : Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 300,
                        width: 250,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: const Image(
                              fit: BoxFit.fill,
                              colorBlendMode: BlendMode.luminosity,
                              image: NetworkImage(
                                  'https://media.istockphoto.com/photos/gathering-items-to-be-donated-to-charity-items-are-placed-on-a-futon-picture-id1339697803?b=1&k=20&m=1339697803&s=170667a&w=0&h=bYarLvJS8g6GLQcj9WHuCOAFr6ouMjgu7mTktgolsEc=')),
                        ),
                      ),
                    ),
                    Center(
                      heightFactor: 6,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        child: Text('Add Image*',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => _selectImage(context),
                      ),
                    )
                  ],
                ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFieldInput(
                validate: null,
                controller: _titleController,
                password: false,
                hintText: 'Enter Title*',
                type: TextInputType.text),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              height: 130,
              width: double.infinity,
              child: TextField(
                  maxLines: 6,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      hintText:
                          'Enter Description in at least 20 characters*       (Size,Quantity,Quality,etc.)')),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                      hint: const Text('Select NGO*'),
                      value: _selectedNGO,
                      items: _ngo.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedNGO = newValue!;
                        });
                      }),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Visibility(
              visible: vis,
              child: Container(
                height: 30,
                width: 90,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    color: primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (_file != null &&
                  _titleController.text.isEmpty == false &&
                  _descriptionController.text.length > 20 &&
                  _descriptionController.text.isEmpty == false &&
                  _selectedNGO != _ngo[0]) {
                _alertDialog(context);

                // setState(() {
                //   otherVis = false;
                //   vis = true;
                // });
              } else {
                showSnackBar('All Fields are Mandatory', context);
              }
            },
            child: Visibility(
              visible: otherVis,
              child: Container(
                height: 30,
                width: 100,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    color: primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
