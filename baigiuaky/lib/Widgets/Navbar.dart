import 'package:baigiuaky/Widgets/Quanly_phongDoi.dart';
import 'package:baigiuaky/Widgets/Quanly_phongDon.dart';
import 'package:baigiuaky/Widgets/danhsach_phongDoi.dart';
import 'package:flutter/material.dart';
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
        UserAccountsDrawerHeader(
          accountName: Text('MyHotelGroup6'),
          accountEmail:Text('group6hotelmanager@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child:Image.network('https://media.licdn.com/dms/image/C4E0BAQG8m8z0xRY9cw/company-logo_200_200/0/1631317444689?e=2147483647&v=beta&t=VNQCaixaQiFokvsQ7ia3Ql3ycm45_vR6DlH0k4lsSr4',
                width:70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.navadahotel.com/FileStorage/Room/Thumbnail/DSC_2755-HDR.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
          ListTile(
            leading:ClipOval(
              child: Image.network(
                'https://www.lottehotel.com/content/dam/lotte-hotel/lotte/hanoi/accommodation/standard/deluxeroom/180928-3-2000-roo-LTHA.jpg.thumb.768.768.jpg',
                width: 40,
                height:40 ,
                fit: BoxFit.cover,
              ),
          ),
            title: Text('Danh sách phòng đơn',
              style: TextStyle(
              fontSize: 18,
              ),
            ),
            selected: _selectedIndex == 0,
            onTap: (){
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading:ClipOval(
              child: Image.network(
                'https://www.lottehotel.com/content/dam/lotte-hotel/lotte/hanoi/accommodation/club-floor/clubdeluxeroom/180712-2-2000-acc-hanoi-hotel.jpg.thumb.768.768.jpg',
                width: 40,
                height:40 ,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Danh sách phòng đôi',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            selected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
              Navigator.pop(context);
              print("đây là danh sach phong doi");
            },
          ),
          Divider(),
          ListTile(
            leading:ClipOval(
              child: Image.network(
                'https://media.istockphoto.com/id/1344512181/vi/vec-to/bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-loa-m%C3%A0u-%C4%91%E1%BB%8F.jpg?s=612x612&w=0&k=20&c=t8xmvCQKhdqmyG2ify0vXMIgK5ty7IpOyicWE-Rrpzg=',
                width: 40,
                height:40 ,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Thông báo',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading:ClipOval(
              child: Image.network(
                'https://play-lh.googleusercontent.com/uFxb6hzxtHZ07q-sjcbJYledM5HlFjRVJvjOImqUGKXPSX9koyxYBjoSex4D5jAMS_mD',
                width: 40,
                height:40 ,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Tin nhắn',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading:ClipOval(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/d/dc/Settings-icon-symbol-vector.png',
                width: 40,
                height:40 ,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Cài đặt',
              style: TextStyle(
              fontSize: 18,
              ),
            ),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading:ClipOval(
              child: Image.network(
                'https://banner2.cleanpng.com/20180921/uko/kisspng-privacy-policy-personally-identifiable-information-privacipolicyicon-wellbe-ims-5ba4ba1cb887e6.2139103615375222047559.jpg',
                width: 40,
                height:40 ,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Chính sách bảo mật',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => null,
          ),
          Divider(),

          ListTile(
            leading:ClipOval(
              child: Image.network(
                'https://w7.pngwing.com/pngs/640/527/png-transparent-basic-logout-exit-close-cancel-out-ui-office-icon-thumbnail.png',
                width: 40,
                height:40 ,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Đăng xuất',
              style: TextStyle(
                fontSize: 18,
                fontWeight:FontWeight.w700,
              ),
            ),
            onTap: () => null,
          ),
      ],
      ),
    );
  }
}
