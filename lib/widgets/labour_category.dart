import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/login_google_screen.dart';
import '../screens/engineer_category_screen.dart';

class LabourCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      margin: EdgeInsets.only(
        left: 10,
        top: 15,
        right: 10,
      ),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 10,
                bottom: 8,
              ),
              child: Text(
                'Labour',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              EngineerCategoryScreen.routeName,
                            );
                          },
                          child: Card(
                            color: Color(0xfff1f3f6),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.egg,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text('Migrant'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(0xfff1f3f6),
                          elevation: 0,
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.user,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Local',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
