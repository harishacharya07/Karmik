import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DumperScreen extends StatelessWidget {
  static final routeName = 'dumper';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dumper',
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
