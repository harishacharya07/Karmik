import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/carousel_helper.dart';
import '../login/login_google_screen.dart';
import '../screens/engineer_category_screen.dart';
import '../widgets/contractor_widget.dart';
import '../widgets/engineer_catergory_widget.dart';
import '../widgets/labour_category.dart';

import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<String> images = CarouselHelper.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: GoogleFonts.roboto(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Color(0xff003366),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              margin: EdgeInsets.only(
                top: 10,
                left: 16,
                right: 16,
              ),
              child: Swiper(
                itemCount: images.length,
                autoplayDelay: 3000,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          images[index],
                        ),
                      ),
                    ),
                  );
                },
                autoplay: true,
                onIndexChanged: (index) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.22,
            //   margin: EdgeInsets.only(
            //     left: 10,
            //     top: 25,
            //     right: 10,
            //   ),
            //   width: MediaQuery.of(context).size.width,
            //   // child: Card(
              //   elevation: 3,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.only(
              //           left: 15,
              //           top: 10,
              //           bottom: 8,
              //         ),
              //         child: Text(
              //           'Engineer',
              //           style: GoogleFonts.roboto(
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //       EngineerCategoryWidget(),
              //     ],
              //   ),
              // ),
           // ),
            ContractorWidget(),
            LabourCategory(),
          ],
        ),
      ),
    );
  }
}
