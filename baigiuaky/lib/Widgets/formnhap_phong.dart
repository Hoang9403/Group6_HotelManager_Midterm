import "package:flutter/material.dart";

class FormNhapPhong extends StatefulWidget {
  final Function addRoom;
  FormNhapPhong(this.addRoom);

  @override
  State<FormNhapPhong> createState() => _FormNhapPhongState();
}

class _FormNhapPhongState extends State<FormNhapPhong> {
  final TextEditingController maPhong = TextEditingController();
  final TextEditingController giaPhong = TextEditingController();
  final TextEditingController loaiPhong = TextEditingController();
  String tinhTrangPhong = "Trống";
  void submitData() {
    final enterMaPhong = maPhong.text;
    final enterGiaPhong = giaPhong.text;
    final enterLoaiPhong = loaiPhong.text;
    final entertinhtrangphong = tinhTrangPhong;
    if (enterMaPhong.isNotEmpty &&
        enterGiaPhong.isNotEmpty &&
        enterLoaiPhong.isNotEmpty) {
      widget.addRoom(
        int.tryParse(enterMaPhong) ?? 0,
        enterLoaiPhong,
        entertinhtrangphong,
        double.tryParse(enterGiaPhong) ?? 0.0,
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
              decoration: InputDecoration(labelText: 'Nhập mã phòng'),
              controller: maPhong,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nhập loại phòng'),
              controller: loaiPhong,
            ),
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
            TextField(
              decoration: InputDecoration(labelText: 'Nhập giá phòng'),
              controller: giaPhong,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              child: Text('Thêm phòng'),
              onPressed: () {
                submitData();
              },
            )
          ],
        ),
      ),
    );
  }
}
