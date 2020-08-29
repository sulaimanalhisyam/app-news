import 'package:flutter/material.dart';

Widget myAppBar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('mak',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        Text('News',
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.w600))
      ],
    ),
  );
}
