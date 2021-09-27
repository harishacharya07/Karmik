import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulldozerScreen extends StatelessWidget {
  static final routeName = 'bulldozers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bulldozers',
          style: GoogleFonts.roboto(
            color: Color(0xff003366),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
