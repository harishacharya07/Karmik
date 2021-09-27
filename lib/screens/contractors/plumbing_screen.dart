import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlumbingScreen extends StatelessWidget {
  static final routeName = '/plumbing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plumbing',
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
