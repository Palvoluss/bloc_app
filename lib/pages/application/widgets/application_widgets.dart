import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    Center(
      child: Text("home"),
    ),
    Center(
      child: Text("search"),
    ),
    Center(
      child: Text("course"),
    ),
    Center(
      child: Text("chat"),
    ),
    Center(
      child: Text("profile"),
    ),
  ];

  return _widget[index];
}
