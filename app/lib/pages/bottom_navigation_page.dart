import 'package:flutter/material.dart';
import 'package:helloworld/pages/add_event/add_event_page.dart';
import 'package:helloworld/pages/map/map_page.dart';
import 'package:helloworld/pages/my_list/my_list_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State< BottomNavigationPage> createState() => _BottomNavigationPage();
}

class _BottomNavigationPage extends State< BottomNavigationPage> {
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'マップ'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'マイリスト'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: '追加'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}
