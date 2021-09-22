import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/category/plastering.dart';

import '../login/login_google_screen.dart';
import '../screens/engineer_category_screen.dart';

class ContractorWidget extends StatelessWidget {
  const ContractorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
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
                'Contractor',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
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
                      Text('Civil'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(PlasteringCategoryScreen.routeName);
                          },
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
                      ),
                      Text(
                        'Plastering',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                LoginWithGoogleScreen.routeName);
                          },
                          child: Card(
                            elevation: 0,
                            color: Color(0xfff1f3f6),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.tenge,
                                color: Color(
                                  0xff003366,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Painter',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(
                            0xfff1f3f6,
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.surprise,
                            ),
                          ),
                        ),
                      ),
                      Text('Flooring'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
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
                      Text('Electrification'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
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
                        'Plumbing',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                LoginWithGoogleScreen.routeName);
                          },
                          child: Card(
                            elevation: 0,
                            color: Color(0xfff1f3f6),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.tenge,
                                color: Color(
                                  0xff003366,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Carpenter',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Card(
                          color: Color(
                            0xfff1f3f6,
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.surprise,
                            ),
                          ),
                        ),
                      ),
                      Text('Mason'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
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
                      Text('Truss Work'),
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
