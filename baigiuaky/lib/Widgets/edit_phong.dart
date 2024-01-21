import 'package:baigiuaky/Models/Phong.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';


class EditPhongScreen extends StatefulWidget {
  final Phong phong;
  EditPhongScreen(this.phong);

  @override
  _EditPhongScreenState createState() => _EditPhongScreenState();
}

class _EditPhongScreenState extends State<EditPhongScreen> {
  TextEditingController MaPhongController = TextEditingController();
  String loaiPhong = "Phòng đơn";
  String tinhTrangPhong = "Trống";
  TextEditingController GiaPhongController = TextEditingController();


  @override
  void initState() {
    super.initState();
    MaPhongController.text = widget.phong.maPhong.toString();
    GiaPhongController.text = widget.phong.giaPhong.toString();
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
            Text('Chỉnh sửa thành công!', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                Text('CHỈNH SỬA THÔNG TIN PHÒNG', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: MaPhongController,
                decoration: InputDecoration(labelText: 'Mã phòng: '),
              ),
              Row(
                children: [
                  Text("Chọn loại phòng: "),
                  DropdownButton<String>(
                    value: loaiPhong,
                    onChanged: (String? newValue1) {
                      setState(() {
                        loaiPhong = newValue1!;
                      });
                    },
                    items: <String>['Phòng đơn', 'Phòng đôi'].map((String value1) {
                      return DropdownMenuItem<String>(
                        value: value1,
                        child: Text(value1),
                      );
                    }).toList(),
                  ),
                ],
              ),
              // TextField(
              //   decoration: InputDecoration(labelText: 'Nhập loại phòng'),
              //   controller: loaiPhong,
              // ),
              Row(
                children: [
                  Text("Tình trạng phòng: "),
                  DropdownButton<String>(
                    value: tinhTrangPhong,
                    onChanged: (String? newValue) {
                      setState(() {
                        tinhTrangPhong = newValue!;
                      });
                    },
                    items: <String>['Trống', 'Đã đặt phòng'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              TextFormField(
                controller: GiaPhongController,
                decoration: InputDecoration(labelText: 'Giá phòng: '),
              ),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (await confirm(
                    context,
                    title: const Text('Xác nhận sửa '),
                    content: const Text('Bạn có muốn sửa thông tin phòng ?'),
                    textCancel: const Text('Hủy'),
                    textOK: const Text('Xác nhận'),
                  )) {
                    Phong editPhong = Phong(
                        maPhong: int.parse(MaPhongController.text),
                        loaiPhong: loaiPhong,
                        tinhTrangPhong:tinhTrangPhong,
                        giaPhong: double.parse(GiaPhongController.text)
                    );
                    Navigator.pop(context, editPhong);
                    _showSuccessSnackbar();
                  }
                  return print('pressedCancel');
                },
                child: Text('Lưu Thay Đổi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
