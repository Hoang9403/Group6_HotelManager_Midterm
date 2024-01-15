import 'package:baigiuaky/Models/Khachhang.dart';
import 'package:baigiuaky/Models/Phong.dart';
import 'package:baigiuaky/Widgets/DanhsachKhachhang.dart';
import 'package:baigiuaky/Widgets/Form_timkiem.dart';
import 'package:baigiuaky/Widgets/Navbar.dart';
import 'package:baigiuaky/Widgets/Quanly_phongDoi.dart';
import 'package:baigiuaky/Widgets/Quanly_phongDon.dart';
import 'package:baigiuaky/Widgets/danhsach_phong.dart';
import 'package:baigiuaky/Widgets/danhsach_phongDoi.dart';
import 'package:baigiuaky/Widgets/formdat_phong.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baigiuaky/Widgets/formnhap_phong.dart';
import 'package:baigiuaky/Models/Phong.dart';
class Quanlyphong extends StatefulWidget {
  late List<Phong> danhsachphong;
  final List<Khachhang> danhsachkhachhangoder;
  Quanlyphong(this.danhsachphong,this.danhsachkhachhangoder);
  @override
  State<Quanlyphong> createState() => _QuanlyphongState();
}
class _QuanlyphongState extends State<Quanlyphong> {
  int indexofphong = 0;
  late String sapxep = "Từ A-Z";
  @override
  void deleteRoom(int index) {
    setState(() {
      widget.danhsachphong.removeAt(index);
    });
  }
  void deleteKhachhangoder(int index) {
    setState(() {
      widget.danhsachkhachhangoder.removeAt(index);
    });
  }
  addRoom(int maPhong, String loaiPhong,String tinhTrangPhong, double giaPhong){
    final newRoom = Phong(
        maPhong: maPhong,
        loaiPhong: loaiPhong,
        tinhTrangPhong: tinhTrangPhong,
        giaPhong: giaPhong);
    setState(() {
      widget.danhsachphong.add(newRoom);
    });
  }
  void onDatPhong(int index) {
    widget.danhsachphong[index].tinhTrangPhong = "Đã đặt phòng";
    indexofphong = index;
  }
  void orderRoom(String tenKhachhang, String ngaysinhKhachhang, String diachiKhachhang, String sodienthoaiKhachhang, int MaPhong, String LoaiPhong, double GiaPhong) {
    final newoderRoom = Khachhang(
      tenKhachhang: tenKhachhang,
      ngaysinhKhachhang: ngaysinhKhachhang,
      diachiKhachhang: diachiKhachhang,
      sodienthoaiKhachhang: sodienthoaiKhachhang,
      MaPhong: widget.danhsachphong[indexofphong].maPhong,
      LoaiPhong: widget.danhsachphong[indexofphong].loaiPhong,
      GiaPhong: widget.danhsachphong[indexofphong].giaPhong,
    );

    setState(() {
      widget.danhsachkhachhangoder.add(newoderRoom);
    });
  }
  FormModelAddRoom(BuildContext context){
    showModalBottomSheet(context: context,
      builder:(_){
        return GestureDetector(
          onTap: (){},
          child: FormNhapPhong(addRoom),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  FormModelOderRoom(BuildContext context){
    showModalBottomSheet(context: context,
      builder:(_){
        return GestureDetector(
          onTap: (){},
          child: FormDatPhong(orderRoom),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  int  _currentIndex = 0;
  void onTabTappedBottom(int index) {
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    });
  }
  List<Phong> filteredRooms = [];
  void searchRooms(String searchTerm) {
    if (searchTerm.isEmpty) {
      setState(() {
        filteredRooms = [];
      });
      return;
    }
    List<Phong> results = widget.danhsachphong
        .where((room) => room.maPhong.toString().contains(searchTerm) ||
        room.loaiPhong.toLowerCase().contains(searchTerm.toLowerCase()) ||
        room.tinhTrangPhong.toLowerCase().contains(searchTerm.toLowerCase()) ||
        room.giaPhong.toString().contains(searchTerm))
        .toList();
    setState(() {
      filteredRooms = results;
    });
  }
  void deleteRoomFormSearch(int index) {
    setState(() {
      filteredRooms.removeAt(index);
      Phong deletedRoom = filteredRooms[index];
      widget.danhsachphong.removeWhere((phong) => phong.maPhong == deletedRoom.maPhong);
    });
  }
  Widget getBodyWidget(int currentIndex) {
    if (currentIndex == 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            DanhsachPhong(widget.danhsachphong,widget.danhsachkhachhangoder,onDelete: deleteRoom,FormodaloderRoom: () => FormModelOderRoom(context),onDatPhong:onDatPhong),
          ],
        ),
      );
    } else if (currentIndex == 1) {
      return SearchForm(
        onSearch: searchRooms,
        danhsachphong: widget.danhsachphong,
        filteredRooms: filteredRooms,
        searchRooms: searchRooms,
        deleteRoomFormSearch: deleteRoomFormSearch,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (sapxep == "Từ Z-A") {
      setState(() {
        widget.danhsachphong = List.from(widget.danhsachphong.reversed);
      });
    } else {
      setState(() {
        widget.danhsachphong.sort((a, b) => a.maPhong.compareTo(b.maPhong));
      });
    }
    return Scaffold(
     drawer: Navbar(),
      body:SingleChildScrollView(
        child: Column(
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Sắp xếp theo: ",style: TextStyle(color: Colors.black)),
            DropdownButton<String>(
          value: sapxep,
          onChanged: (String? newValue1) {
            setState(() {
              sapxep = newValue1!;
            });
          },
          items: <String>['Từ A-Z', 'Từ Z-A'].map((String value1) {
            return DropdownMenuItem<String>(
              value: value1,
              child: Text(value1),
            );
          }).toList(),
            ),
          ],
          ),
            getBodyWidget(_currentIndex),
          ],
        ),
      ) ,
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => FormModelAddRoom(context),
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Tìm kiếm',
            icon: Icon(Icons.find_in_page),
          ),
        ],
        currentIndex: _currentIndex,
        onTap:onTabTappedBottom,
      ),
    );
  }
}

