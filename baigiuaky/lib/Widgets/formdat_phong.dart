import "package:flutter/material.dart";

class FormDatPhong extends StatefulWidget {
  final Function oderRoom;
  FormDatPhong (this.oderRoom);
  @override
  State<FormDatPhong > createState() => _FormDatPhongState();
}
class _FormDatPhongState extends State<FormDatPhong > {
  final TextEditingController tenKhachhang = TextEditingController();
  final TextEditingController ngaysinhKhachhang = TextEditingController();
  final TextEditingController diachiKhachhang = TextEditingController();
  final TextEditingController sodienthoaiKhachhang = TextEditingController();
  late int maphong = 0;
  late String loaiphong="hehe";
  late double giaphong=0;
  void submitDataKhachhang() {
    final entertenKhachhang = tenKhachhang.text;
    final enterngaysinhKhachhang = ngaysinhKhachhang.text;
    final enterdiachiKhachhang = diachiKhachhang.text;
    final entersodienthoaiKhachhang= sodienthoaiKhachhang.text;
    final entermaphong = maphong;
    final enterloaiphong = loaiphong;
    final entergiaphong = giaphong;
    if (entertenKhachhang.isNotEmpty &&
        enterngaysinhKhachhang.isNotEmpty &&
        enterdiachiKhachhang.isNotEmpty &&
        entersodienthoaiKhachhang.isNotEmpty){
      widget.oderRoom(
        entertenKhachhang,
        enterngaysinhKhachhang ,
        enterdiachiKhachhang ?? "Trống",
        entersodienthoaiKhachhang ?? "Trống",
        entermaphong,
        enterloaiphong,
        entergiaphong
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nhập tên khách hàng:'),
              controller: tenKhachhang,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nhập ngày sinh khách hàng:'),
              controller: ngaysinhKhachhang,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Địa chỉ khách hàng:'),
              controller: diachiKhachhang,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Số điện thoại khách hàng:'),
              controller: sodienthoaiKhachhang,
              keyboardType: TextInputType.number,

            ),
            TextButton(
              child: Text('Đặt phòng'),
              onPressed: () {
                submitDataKhachhang();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
