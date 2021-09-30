import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/join/professionals_deatails_screen.dart';

class SelectYourRoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Your Role',
          style: GoogleFonts.roboto(
            color: Color(0xff003366),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfessionalDetailsScreen.routeName);
                    },
                    child: Card(
                      elevation: 1,
                    ),
                  ),
                ),
                Text(
                  'Professionals',
                  style: GoogleFonts.roboto(
                    color: Color(0xff003366),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(),
              ),
              Text(
                'Contractors',
                style: GoogleFonts.roboto(
                  color: Color(0xff003366),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(),
              ),
              Text(
                'Labours',
                style: GoogleFonts.roboto(
                  color: Color(0xff003366),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
