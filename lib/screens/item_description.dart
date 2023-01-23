import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ItemDescription extends StatefulWidget {
  final String? userType;
  final String? image;
  final String? title;
  final String? description;
  const ItemDescription(
      {super.key,
      required this.userType,
      required this.image,
      required this.title,
      required this.description});

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.userType == 'NGO' ? Colors.pink : Colors.blue;
    print(widget.title);
    print(widget.description);
    print(widget.title);
    print(widget.image);
    return Scaffold(
      appBar: widget.userType == 'NGO'
          ? AppBar(
              backgroundColor: Colors.purple,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: Text("Donate"),
              centerTitle: true,
            )
          : AppBar(
              backgroundColor: Colors.blue,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: Text("Donate"),
              centerTitle: true,
            ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Container(
              height: 300,
              width: 270,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'Backened/uploads/${widget.image.toString()}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          widget.title == null
              ? Text('hello')
              : Text(
                  widget.title!,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                  maxLines: 2,
                ),
          SizedBox(
            height: 6,
          ),
          Divider(
            thickness: 2,
          ),
          const Text(
            'DESCRIPTION',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 20,
          ),
          widget.description == null
              ? Text('No Description')
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.description!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    maxLines: 50,
                    textAlign: TextAlign.start,
                  ),
                ),
          SizedBox(
            height: 6,
          ),
          Divider(
            thickness: 2,
          ),
          widget.userType == "NGO"
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        color: Colors.green,
                        child: Center(child: Text("ACCEPT")),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        color: Colors.red,
                        child: Center(child: Text("DECLINE")),
                      )
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'STATUS',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'IN PROCESS',
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                )
        ],
      )),
    );
  }
}
