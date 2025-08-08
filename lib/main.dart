import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/login.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
  ));
}
