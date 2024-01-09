import 'package:baigiuaky/Models/Phong.dart';
import 'package:baigiuaky/Widgets/danhsach_phong.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Widgets/formnhap_phong.dart';
class Quanlyphong extends StatefulWidget {
  @override
  State<Quanlyphong> createState() => _QuanlyphongState();
}
class _QuanlyphongState extends State<Quanlyphong> {
  final List<Phong> danhsachphong =[
    Phong(maPhong: 108, loaiPhong:"Phòng đôi", tinhTrangPhong:"Trống", giaPhong: 20000),
    Phong(maPhong: 106, loaiPhong:"Phòng đôi", tinhTrangPhong:"Trống", giaPhong: 20000),
    Phong(maPhong: 107, loaiPhong: "Phòng đơn", tinhTrangPhong: "Đã đặt phòng", giaPhong: 50000),
    Phong(maPhong: 105, loaiPhong: "Phòng đơn", tinhTrangPhong: "Trống", giaPhong: 70000),
    Phong(maPhong: 104, loaiPhong: "Phòng đơn", tinhTrangPhong: "Trống", giaPhong: 70000),
    Phong(maPhong: 103, loaiPhong: "Phòng đơn", tinhTrangPhong: "Đã đặt phòng", giaPhong: 70000),
    Phong(maPhong: 102, loaiPhong: "Phòng đơn", tinhTrangPhong: "Đã đặt phòng", giaPhong: 70000),
  ];
  void deleteRoom(int index) {
    setState(() {
      danhsachphong.removeAt(index);
    });
  }
  addRoom(int maPhong, String loaiPhong,String tinhTrangPhong, double giaPhong){
    final newRoom = Phong(
        maPhong: maPhong,
        loaiPhong: loaiPhong,
        tinhTrangPhong: tinhTrangPhong,
        giaPhong: giaPhong);
    setState(() {
      danhsachphong.add(newRoom);
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
  @override
  Widget build(BuildContext context) {
    danhsachphong.sort((a, b) => a.maPhong.compareTo(b.maPhong));
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            DanhsachPhong(danhsachphong, onDelete: deleteRoom),
          ],
        ),
      ) ,
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => FormModelAddRoom(context),
    ),
    );
  }
}
