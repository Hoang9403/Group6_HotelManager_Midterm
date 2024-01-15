import 'package:flutter/material.dart';
import 'package:baigiuaky/Models/Phong.dart';

class SearchForm extends StatefulWidget {
  final Function(String) onSearch;
  final List<Phong> danhsachphong;
  final List<Phong> filteredRooms;
  final void Function(String) searchRooms;
  final Function(int) deleteRoomFormSearch;
  const SearchForm({
    Key? key,
    required this.onSearch,
    required this.danhsachphong,
    required this.filteredRooms,
    required this.searchRooms,
    required this.deleteRoomFormSearch,
  }) : super(key: key);

  @override
  _SearchFormState createState() => _SearchFormState();
}
class _SearchFormState extends State<SearchForm> {
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(onSearch: (searchTerm) {
          widget.searchRooms(searchTerm);
        }),
        SizedBox(height: 10),
        if (widget.filteredRooms.isNotEmpty)
          ...widget.filteredRooms.map((phong) {
            return buildPhongCard(phong);
          }).toList(),
        if (widget.filteredRooms.isEmpty)
          Text('Không tìm thấy phòng'),
      ],
    );
  }
  Widget buildPhongCard(Phong phong) {
    Color textColor = phong.tinhTrangPhong == 'Đã đặt phòng' ? Colors.green : Colors.grey;
    String textButton = phong.tinhTrangPhong == "Đã đặt phòng" ? "Trả phòng" : "Đặt phòng";
    Color buttonColor = phong.tinhTrangPhong == 'Đã đặt phòng' ? Colors.green : Colors.blue;
    return Card(
      child: Column(
        children: <Widget>[
          // Hiển thị thông tin phòng và hành động
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
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (phong.tinhTrangPhong == "Đã đặt phòng") {
                        // Xử lý khi nút "Trả phòng" được nhấn
                      } else {
                        // Xử lý khi nút "Đặt phòng" được nhấn
                      }
                    },
                    child: Text(
                      textButton,
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
                      // Xử lý khi nút "Sửa phòng" được nhấn
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
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.deleteRoomFormSearch(widget.filteredRooms.indexOf(phong));
                      print("xóa phòng");
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
  }
}
class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  const SearchBar({Key? key, required this.onSearch}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}
class _SearchBarState extends State<SearchBar> {
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                widget.onSearch(value);
              },
              decoration: InputDecoration(
                hintText: 'Nhập mã phòng hoặc loại phòng...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              String searchTerm = _searchController.text.trim();
              widget.onSearch(searchTerm);
            },
            child: Text('Tìm kiếm'),
          ),
        ],
      ),
    );
  }
}