import 'package:baigiuaky/Widgets/Quanly_phong.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Widgets/Navbar.dart';
import 'package:baigiuaky/Widgets/Home.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
