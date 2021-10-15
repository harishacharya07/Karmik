import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HardWareShopsWidget extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;
  final String noOfStars;

  HardWareShopsWidget({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.noOfStars,
  });

  _makingPhoneCall() async {
    const url = 'tel:9845280497';
    try {
      await launch(url);
    } catch (error) {
      print(" $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size.width;
    final _mediaQueryHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: 100,
      child: Card(
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: _mediaQuery * 0.28,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                    placeholder: AssetImage(
                      'assets/images/login.png',
                    ),
                  ),
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
                          softWrap: true,
                          maxLines: 1,
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
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              noOfStars,
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
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
                      child: Icon(
                        Icons.call,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
