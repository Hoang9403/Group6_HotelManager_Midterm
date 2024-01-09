import 'package:baigiuaky/Models/Phong.dart';
import 'package:baigiuaky/Widgets/Quanly_phong.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Widgets/Navbar.dart';
import 'package:baigiuaky/Widgets/formnhap_phong.dart';
import 'package:baigiuaky/Models/Phong.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  //List các giao diện thêm vào đây để bấm được các nút BottomNavbar
  final List<Widget> _children = [
    Quanlyphong(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Khách Sạn Của Tôi",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Tìm kiếm',
            icon: Icon(Icons.find_in_page),
          ),
          BottomNavigationBarItem(
            label: 'User',
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
