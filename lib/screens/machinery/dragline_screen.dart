import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DragLineScreen extends StatelessWidget {
  static final routeName = '/drag_line';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DragLine',
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
