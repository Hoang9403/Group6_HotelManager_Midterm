import 'package:baigiuaky/Models/Phong.dart';
import 'package:baigiuaky/Widgets/danhsach_phongdoi.dart';
import 'package:flutter/cupertino.dart';
import 'package:baigiuaky/Widgets/danhsach_phongdon.dart';
import 'package:flutter/material.dart';

class Quanlyphong extends StatelessWidget {
  final List<Phong> danhsachphongdoi =[
    Phong(maPhong: 108, loaiPhong:"Phòng đôi", tinhTrangPhong:"Trống", giaPhong: 20000),
    Phong(maPhong: 106, loaiPhong:"Phòng đôi", tinhTrangPhong:"Trống", giaPhong: 20000)
  ];
  final List<Phong> danhsachphongdon = [
    Phong(maPhong: 107, loaiPhong: "Phòng đơn", tinhTrangPhong: "Đã đặt phòng", giaPhong: 50000),
    Phong(maPhong: 105, loaiPhong: "Phòng đơn", tinhTrangPhong: "Trống", giaPhong: 70000),
    Phong(maPhong: 104, loaiPhong: "Phòng đơn", tinhTrangPhong: "Trống", giaPhong: 70000),
    Phong(maPhong: 103, loaiPhong: "Phòng đơn", tinhTrangPhong: "Đã đặt phòng", giaPhong: 70000),
    Phong(maPhong: 102, loaiPhong: "Phòng đơn", tinhTrangPhong: "Đã đặt phòng", giaPhong: 70000),
  ];
  @override
  Widget build(BuildContext context) {
    danhsachphongdoi.sort((a, b) => a.maPhong.compareTo(b.maPhong));
    danhsachphongdon.sort((a, b) => a.maPhong.compareTo(b.maPhong));
    return Column(
      children: [
        DanhsachPhongdoi(danhsachphongdoi),
        DanhsachPhongdon(danhsachphongdon),
      ],
    );
  }
}
