import 'package:baigiuaky/Widgets/Quanly_phong.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Widgets/Navbar.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar:  AppBar(
        iconTheme:const IconThemeData(color: Colors.white),
        title: Text("Khách Sạn Của Tôi",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Quanlyphong(),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon:Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Thêm phòng',
              icon:Icon(Icons.add),
            ), BottomNavigationBarItem(
              label: 'Tìm kiếm',
              icon:Icon(Icons.find_in_page),
            ),
          ],
          currentIndex: _currentIndex,
          onTap:(index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
    );
  }
}