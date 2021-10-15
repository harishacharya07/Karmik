import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:karmik/login/login_google_screen.dart';
import 'package:karmik/screens/creator/creator_dash_screen.dart';
import 'package:karmik/screens/engineer_category_screen.dart';
import 'package:karmik/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String user = '';

  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    logindata = await SharedPreferences.getInstance();
    final user = logindata.getString('user');
    // ignore: unrelated_type_equality_checks
    if (user == 'creator') {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder: (context) => CreatorDashScreen(),
          ),
        );
      });
    } else if (user == 'client') {
      Future.delayed(
        Duration(seconds: 4),
        () {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
              builder: (context) => BottomNavigationScreen(),
            ),
          );
        },
      );
    } else {
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => LoginWithGoogleScreen(),
        ),
      );
    }
    // ignore: unrelated_type_equality_checks
    // if (newuser == false) {
    //   Future.delayed(Duration(seconds: 3), () {
    //     Navigator.pushReplacement(
    //       context,
    //       new MaterialPageRoute(
    //         builder: (context) => CreatorDashScreen(),
    //       ),
    //     );
    //   });
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     new MaterialPageRoute(
    //       builder: (context) => LoginWithGoogleScreen(),
    //     ),
    //   );
    // }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitWave(
            color: Color(
              0xff003366,
            ),
          ),
          Text(user),
        ],
      ),
    );
  }
}
