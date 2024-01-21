
import 'package:baigiuaky/Widgets/formdat_phong.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/Phong.dart';
import 'package:baigiuaky/Models/Khachhang.dart';
class DanhsachKhachhang extends StatefulWidget {
  final List<Khachhang> danhsachoderroom;
  DanhsachKhachhang(this.danhsachoderroom);

  @override
  State<DanhsachKhachhang> createState() => _DanhsachKhachhangState();
}

class _DanhsachKhachhangState extends State<DanhsachKhachhang> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.danhsachoderroom.map((khachhang) {
        return Card(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mã phòng:  ' + khachhang.MaPhong.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Tên khách hàng:  ' + khachhang.tenKhachhang,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Ngày sinh: ${khachhang.ngaysinhKhachhang.day}/${khachhang.ngaysinhKhachhang.month}/${khachhang.ngaysinhKhachhang.year}' ,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Địa chỉ: ' + khachhang.diachiKhachhang,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Số điện thoại: ' + khachhang.sodienthoaiKhachhang,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),Text(
                          'Loại phòng: ' + khachhang.LoaiPhong,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),Text(
                          'Giá phòng: ' + khachhang.GiaPhong.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(onPressed: (){},
                            child: Text("Sửa"),
                        ),
                        ElevatedButton(onPressed: (){},
                          child: Text("Xóa"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
