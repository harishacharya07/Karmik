import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlooringScreen extends StatelessWidget {
  static final routeName = '/flooring';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flooring Work',
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
