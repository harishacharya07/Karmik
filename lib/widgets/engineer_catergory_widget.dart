import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/engineer_category_screen.dart';

import '../login/login_google_screen.dart';

class EngineerCategoryWidget extends StatelessWidget {
  const EngineerCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text('Engineer'),
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
                'Architect',
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
                  'Interior',
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
              Text('Surveyor'),
            ],
          ),
        ],
      ),
    );
  }
}
