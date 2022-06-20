import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/join/labour_join_screen.dart';

class CreatorHomeScreen extends StatelessWidget {
  const CreatorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add skills to get Job',
          style: GoogleFonts.roboto(
            color: Color(
              0xff003366,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        tooltip: 'Add Post',
        child: Center(
          child: Icon(
            Icons.add,
            color: Color(
              0xff003366,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(LabourJoinScreen.routeName);
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
