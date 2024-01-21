import 'package:baigiuaky/Widgets/Quanly_phong.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Widgets/Navbar.dart';
import 'package:baigiuaky/Widgets/Home.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
