import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/details_screen.dart';

class MachineryWidget extends StatelessWidget {
  final String title;
  //final String imageUrl;
  final String id;
  //final String location;

  MachineryWidget({
    required this.id,
    //required this.imageUrl,
    required this.title,
   // required this.location,
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
                    // child: FadeInImage(
                    //   fit: BoxFit.cover,
                    //   image: NetworkImage(imageUrl),
                    //   placeholder: AssetImage(
                    //     'assets/images/login.png',
                    //   ),
                    // ),
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
                            title,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'location',
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
                                  '800',
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
    );
  }
}
