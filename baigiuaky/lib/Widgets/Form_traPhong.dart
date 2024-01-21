import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Models/Khachhang.dart';
import 'package:baigiuaky/Models/Phong.dart';

class FormTraPhong extends StatefulWidget {
  final Khachhang khachHang;
  final List<Khachhang> danhsachkhachhang;
  final List<Phong> danhsachphong;
  final Phong phong;
  FormTraPhong(this.danhsachphong,this.danhsachkhachhang,{required this.khachHang, required this.phong,});
  @override
  _FormTraPhongState createState() => _FormTraPhongState();
}
class _FormTraPhongState extends State<FormTraPhong> {
  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(width: 8),
            Text('Đã trả phòng !', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
  int findPhongIndex(Phong phong, List<Phong> danhSachPhong) {
    for (int i = 0; i < danhSachPhong.length; i++) {
      if (danhSachPhong[i].maPhong == phong.maPhong) {
        return i;
      }
    }
    return -1; //
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin khách hàng:',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
          Text('Họ và tên: ${widget.khachHang.tenKhachhang}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text('Ngày sinh: ${widget.khachHang.ngaysinhKhachhang.day}/${widget.khachHang.ngaysinhKhachhang.month}/${widget.khachHang.ngaysinhKhachhang.year}',
            style: TextStyle(
              fontSize: 20,
            ),),
          Text('Địa chỉ: ${widget.khachHang.diachiKhachhang}',
            style: TextStyle(
              fontSize: 20,
            ),),
          Text('Số điện thoại: ${widget.khachHang.sodienthoaiKhachhang}',
            style: TextStyle(
              fontSize: 20,
            ),),
          SizedBox(height: 16.0),
          Text(
            'Thông tin phòng:',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
          Text('Mã phòng: ${widget.phong.maPhong}',
            style: TextStyle(
              fontSize: 20,
            ),),
          Text('Loại phòng: ${widget.phong.loaiPhong}',
            style: TextStyle(
              fontSize: 20,
            ),),
          Text('Giá phòng: ${widget.phong.giaPhong}',
            style: TextStyle(
              fontSize: 20,
            ),),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (await confirm(
                    context,
                    title: const Text('Xác nhận trả phòng '),
                    content: const Text('Bạn có muốn trả phòng ?'),
                    textCancel: const Text('Hủy'),
                    textOK: const Text('Xác nhận'),
                  )) {
                    int index = findPhongIndex(widget.phong, widget.danhsachphong);
                    if (index != -1) {
                      setState(() {
                        widget.danhsachphong[index].tinhTrangPhong = "Trống";
                        widget.danhsachkhachhang.remove(widget.khachHang);
                      });
                    }
                     Navigator.pop(context);
                    _showSuccessSnackbar();
                  }
                  return print('pressedCancel');
                },
                child: Text('Trả phòng',style: TextStyle(color: Colors.green,fontSize: 20),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}