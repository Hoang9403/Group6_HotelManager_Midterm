
import 'package:baigiuaky/Widgets/edit_phong.dart';
import 'package:flutter/material.dart';
import '../Models/Phong.dart';
class DanhsachPhongDon extends StatefulWidget {
  final List<Phong> danhsachphong;
  DanhsachPhongDon(this.danhsachphong, {required this.onDelete});
  final Function (int) onDelete;

  @override
  State<DanhsachPhongDon> createState() => _DanhsachPhongDonState();
}

class _DanhsachPhongDonState extends State<DanhsachPhongDon> {
  void _editPhong(BuildContext context, Phong phong) {
    // Chuyển sang màn hình chỉnh sửa và đợi kết quả trả về
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPhongScreen(phong),
      ),
    ).then((editedPhong) {
      if (editedPhong != null) {
        // Nếu có thông tin nhân viên chỉnh sửa, cập nhật lại danh sách
        int index = widget.danhsachphong.indexOf(phong);
        setState(() {
          widget.danhsachphong[index] = editedPhong;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final DanhsachPhongDon =widget.danhsachphong.where((phong) => phong.loaiPhong == "Phòng đơn");
    return Column(
      children: DanhsachPhongDon.map((phong) {
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
                      Divider(),
                      Text(
                        'Loại phòng: ' + phong.loaiPhong,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Trạng thái: ' + phong.tinhTrangPhong,
                        style: TextStyle(
                          color: textColor,
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
                            // Xử lý logic khi nút được nhấn trong trạng thái đã đặt phòng
                            print('Đã nhấn vào nút Trả phòng');
                          } else {
                            // Xử lý logic khi nút được nhấn trong trạng thái khác đã đặt phòng
                            print('Đã nhấn vào nút Đặt phòng');
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
                    SizedBox(width: 8), // Khoảng cách giữa các nút
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
