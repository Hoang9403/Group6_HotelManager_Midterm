
import 'package:baigiuaky/Widgets/edit_phong.dart';
import 'package:baigiuaky/Widgets/formdat_phong.dart';
import 'package:flutter/material.dart';
import '../Models/Phong.dart';
import 'package:baigiuaky/Models/Khachhang.dart';
class DanhsachPhong extends StatefulWidget {
  final List<Phong> danhsachphong;
  final List<Khachhang> danhsachoderroom;
  final Function () FormodaloderRoom;
  final Function(int) onDatPhong;
  DanhsachPhong(this.danhsachphong,this.danhsachoderroom,{required this.onDelete, required this.FormodaloderRoom,required this.onDatPhong,required this.onTraPhong});
  final Function (int) onDelete;
  final Function (int ) onTraPhong;

  @override
  State<DanhsachPhong> createState() => _DanhsachPhongState();
}

class _DanhsachPhongState extends State<DanhsachPhong> {
  void _editPhong(BuildContext context, Phong phong) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPhongScreen(phong),
      ),
    ).then((editedPhong) {
      if (editedPhong != null) {
        int index = widget.danhsachphong.indexOf(phong);
        setState(() {
          widget.danhsachphong[index] = editedPhong;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.danhsachphong.map((phong) {
        Color textColor = phong.tinhTrangPhong == 'Đã đặt phòng' ? Colors.green : Colors.grey;
        String Textbutton = "";
        if (phong.tinhTrangPhong == "Đã đặt phòng") {
          Textbutton = "Trả phòng";
        } else {
          Textbutton = "Đặt phòng";
        }
        Color buttonColor = phong.tinhTrangPhong == 'Đã đặt phòng' ? Colors.green : Colors.blue;
        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical:20,
                      horizontal: 15,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      'https://acihome.vn/uploads/15/mau-thiet-ke-noi-that-phong-2-giuong-don-ben-trong-khach-san-3-4-5-sao-2.JPG',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phòng ' + phong.maPhong.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Loại phòng: ' + phong.loaiPhong,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Trạng thái: ' + phong.tinhTrangPhong,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Giá phòng: ' + phong.giaPhong.toString(),
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (phong.tinhTrangPhong == "Đã đặt phòng") {
                            widget.onTraPhong(widget.danhsachphong.indexOf(phong));
                            print('Đã nhấn vào nút Trả phòng');
                          } else {
                            widget.FormodaloderRoom();
                            widget.onDatPhong(widget.danhsachphong.indexOf(phong));
                          }
                        },
                        child: Text(
                          "${Textbutton}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _editPhong(context,phong);
                        },
                        child: Text(
                          "Sửa phòng",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Khoảng cách giữa các nút
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onDelete(widget.danhsachphong.indexOf(phong));
                        },
                        child: Text(
                          "Xóa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
