import "package:flutter/material.dart";
import 'package:intl/intl.dart';
class FormDatPhong extends StatefulWidget {
  final Function oderRoom;
  FormDatPhong (this.oderRoom);
  @override
  State<FormDatPhong > createState() => _FormDatPhongState();
}
class _FormDatPhongState extends State<FormDatPhong > {
  final TextEditingController tenKhachhang = TextEditingController();
  DateTime _ngaySinh = DateTime.now();
  final TextEditingController diachiKhachhang = TextEditingController();
  final TextEditingController sodienthoaiKhachhang = TextEditingController();
  late int maphong = 0;
  late String loaiphong="hehe";
  late double giaphong=0;
  void submitDataKhachhang() {
    final entertenKhachhang = tenKhachhang.text;
    final enterngaysinhKhachhang = _ngaySinh;
    final enterdiachiKhachhang = diachiKhachhang.text;
    final entersodienthoaiKhachhang= sodienthoaiKhachhang.text;
    final entermaphong = maphong;
    final enterloaiphong = loaiphong;
    final entergiaphong = giaphong;
    if (entertenKhachhang.isNotEmpty &&
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
            Text('Đặt phòng thành công', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nhập tên khách hàng:'),
              controller: tenKhachhang,
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Ngày sinh khách hàng: " + DateFormat('dd-MM-yyyy').format(_ngaySinh)  ,style: TextStyle(fontSize: 17)),
                TextButton(onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _ngaySinh,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null && pickedDate != _ngaySinh) {
                    setState(() {
                      _ngaySinh = pickedDate;
                    }
                    );
                  }
                  },
                    child:const Text("Thay đổi")),
              ],
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
                _showSuccessSnackbar();
              },
            )
          ],
        ),
      ),
    );
  }
}
