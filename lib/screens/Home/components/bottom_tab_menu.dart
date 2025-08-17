import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Home/hometabscreen.dart';
import 'package:mysff_flutter/screens/Home/moretabscreen.dart';
import 'package:mysff_flutter/screens/Home/packagetabscreen.dart';

class BottomTabMenu extends StatefulWidget {
  const BottomTabMenu({Key? key}) : super(key: key);

  @override
  State<BottomTabMenu> createState() => _BottomTabMenuState();
}

class _BottomTabMenuState extends State<BottomTabMenu> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeTabScreen(
      key: Key('home_tab'),
    ),
    PackageTabScreen(
      key: Key('package_tab'),
    ),
    MoreTabScreen(
      key: Key('more_tab'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'More',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Lifestyle',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'More',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}