import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpinKitWave(
            color: Color(
              0xff003366,
            ),
          ),
        ],
      ),
    );
  }
}
