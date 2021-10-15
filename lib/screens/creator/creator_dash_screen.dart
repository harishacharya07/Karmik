import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/creator/creator_comment.dart';
import 'package:karmik/screens/creator/creator_home.dart';
import 'package:karmik/screens/spalsh_screen.dart';
import 'package:karmik/widgets/app_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatorDashScreen extends StatefulWidget {
  @override
  _CreatorDashScreenState createState() => _CreatorDashScreenState();
}

class _CreatorDashScreenState extends State<CreatorDashScreen> {
  final _user = FirebaseAuth.instance.currentUser;

  Future<void> _remove(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user").then((value) {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        ),
      );
    });
  }

  List<Widget> _pages = [
    CreatorHomeScreen(),
    CreatorCommentScreen(),
  ];

  int _selectedIndex = 0;

  void _update(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                _user!.photoURL.toString(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _remove(context);
            },
            child: Column(
              children: [
                Icon(
                  Icons.more_vert,
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text(
          'Dash Board',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Color(
              0xff003366,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        selectedItemColor: Color(
          0xff003366,
        ),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dashcube),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: 'Comments',
          ),
        ],
        onTap: _update,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
