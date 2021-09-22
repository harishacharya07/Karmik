import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlasteringCategoryScreen extends StatelessWidget {
  static final routeName = '/category_plastering';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          'Plastering',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Color(0xff003366),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Column(
          children: [

          ],
        ),
      ),
    );
  }
}
