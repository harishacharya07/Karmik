import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/details_screen.dart';

class LabourWidget extends StatelessWidget {
  final String id;
  final String name;
  final String age;
  final String experience;
  final String wage;
  final String price;
  final String location;
  final String mobileNumber;
  final String imageUrl;

  LabourWidget({
    required this.id,
    required this.name,
    required this.age,
    required this.experience,
    required this.location,
    required this.imageUrl,
    required this.mobileNumber,
    required this.price,
    required this.wage,
  });

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size.width;
    final _mediaQueryHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: 100,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            DetailsScreen.routeName,
            arguments: id,
          );
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: _mediaQuery * 0.28,
                    height: 90,
                    child: CircleAvatar(
                      radius: 5,
                      foregroundImage: NetworkImage(imageUrl),
                      backgroundImage: AssetImage('assets/images/login.png'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 12,
                        left: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              name,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            location,
                            style: GoogleFonts.poppins(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          width: 60,
                          height: 33,
                          top: 18,
                          right: 20,
                          child: Card(
                            color: Colors.grey,
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.rupeeSign,
                                    size: 11,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    price,
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
