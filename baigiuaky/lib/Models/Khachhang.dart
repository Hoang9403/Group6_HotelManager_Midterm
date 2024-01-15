import 'package:baigiuaky/Models/Phong.dart';
class Khachhang{
  late String tenKhachhang;
  DateTime ngaysinhKhachhang = DateTime.now();
  late String diachiKhachhang;
  late String sodienthoaiKhachhang;
  final int MaPhong;
  final String LoaiPhong;
  final double GiaPhong;
  Khachhang({
    required this.tenKhachhang,
    required this.ngaysinhKhachhang,
    required this.diachiKhachhang,
    required this.sodienthoaiKhachhang,
    required this.MaPhong,
    required this.LoaiPhong,
    required this.GiaPhong,
  });
}
