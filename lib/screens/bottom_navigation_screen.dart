import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/profile_screen.dart';
import '../screens/hotspot_screen.dart';
import '../screens/machinery_screens.dart';
import '../screens/shops_screens.dart';
import '../screens/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  static final routeName = '/bottom_navigation';

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  static final routeName = '/home_screen';
  List<Widget> _pages = [
    HomeScreen(),
    ShopScreen(),
    HotSpotScreen(),
    MachineryScreen(),
    ProfileScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Color(0xff003366),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        elevation: 10.00,
        iconSize: 20,
        selectedFontSize: 10,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.store,
            ),
            label: 'Shops',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.map,
            ),
            label: 'HotSpot',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.personBooth,
            ),
            label: 'Machinery',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.user,
            ),
            label: 'Profile',
          ),
        ],
        onTap: _selectedPage,
      ),
    );
  }
}
