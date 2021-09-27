import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/machinery/backhoe_screen.dart';
import 'package:karmik/screens/machinery/bulldozers_screen.dart';
import 'package:karmik/screens/machinery/cranes_screen.dart';
import 'package:karmik/screens/machinery/dragline_screen.dart';
import 'package:karmik/screens/machinery/dumpper.dart';
import 'package:karmik/screens/machinery/excavator_screen.dart';
import 'package:karmik/screens/machinery/graders_screen.dart';
import 'package:karmik/screens/machinery/loaders_screen.dart';

class MachineryCategoryWidget extends StatelessWidget {
  final String imageUrl;

  MachineryCategoryWidget({required this.imageUrl,});


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ExcavatorScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Excavator',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(BackHoeScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Backhoe',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(DragLineScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'DragLine',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(BulldozerScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Bulldozers',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(GradersScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Graders',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(DumperScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Scrapper',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(LoaderScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Loaders',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CranesScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Cranes',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CranesScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              shadowColor: Color(0xff003366),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Concrete Mixer',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
