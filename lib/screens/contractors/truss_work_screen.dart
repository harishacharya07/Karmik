import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrussWorkScreen extends StatelessWidget {
  static final routeName = '/truss_work';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Truss Work',
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
