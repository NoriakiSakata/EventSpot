import 'package:flutter/material.dart';
import 'package:helloworld/pages/add_event/add_event_page.dart';
import 'package:helloworld/pages/map/map_page.dart';
import 'package:helloworld/pages/my_list/my_list_page.dart';
import 'package:helloworld/themes/app_colors.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPage();
}

class _BottomNavigationPage extends State<BottomNavigationPage> {
  static const _screens = [
    MapPage(),
    MyListPage(),
    AddEventPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.text1,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            barItem(iconData: Icons.pin_drop_outlined, index: 0, label: 'マップ'),
            barItem(iconData: Icons.list_alt, index: 0, label: 'マイリスト'),
            barItem(iconData: Icons.add, index: 0, label: '追加'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }

  BottomNavigationBarItem barItem({
    required IconData iconData,
    required int index,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: AppColors.text1,
      ),
      label: label,
      activeIcon: Container(
          width: 65,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.pink,
          ),
          child: Icon(
            iconData,
            color: AppColors.text1,
          )),
    );
  }
}
