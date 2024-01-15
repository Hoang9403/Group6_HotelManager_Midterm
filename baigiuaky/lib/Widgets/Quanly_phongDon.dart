import 'package:baigiuaky/Models/Phong.dart';
import 'package:baigiuaky/Widgets/Navbar.dart';
import 'package:baigiuaky/Widgets/danhsach_phong.dart';
import 'package:baigiuaky/Widgets/danhsach_phongDon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Widgets/formnhap_phong.dart';
class QuanlyphongDon extends StatefulWidget {
  final List<Phong> danhsachphong;
  QuanlyphongDon (this.danhsachphong);
  @override
  State<QuanlyphongDon> createState() => _QuanlyphongState();
}
class _QuanlyphongState extends State<QuanlyphongDon> {
  @override
  void deleteRoom(int index) {
    setState(() {
      widget.danhsachphong.removeAt(index);
    });
  }
  addRoom(int maPhong, String loaiPhong,String tinhTrangPhong, double giaPhong){
    final newRoom = Phong(
        maPhong: maPhong,
        loaiPhong: loaiPhong,
        tinhTrangPhong: tinhTrangPhong,
        giaPhong: giaPhong);
    setState(() {
      if (loaiPhong == "Phòng đơn") {
        widget.danhsachphong.add(newRoom);
      }
      else {
      }
    });
  }
  FormModelAddRoom(BuildContext context){
    showModalBottomSheet(context: context,
      builder:(_){
        return GestureDetector(
          onTap: (){},
          child: FormNhapPhong(addRoom),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  int  _currentIndex = 0;
  void onTabTappedBottom(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    widget.danhsachphong.sort((a, b) => a.maPhong.compareTo(b.maPhong));
    return Scaffold(
        drawer: Navbar(),
        body:SingleChildScrollView(
          child: Column(
            children: [
              DanhsachPhongDon(widget.danhsachphong, onDelete: deleteRoom),
            ],
          ),
        ) ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => FormModelAddRoom(context),
        ),
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
          ],
          currentIndex: _currentIndex,
          onTap:onTabTappedBottom,
        )
    );
  }
}

