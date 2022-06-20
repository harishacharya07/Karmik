import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/widgets/app_drawer.dart';

import '../screens/shops/hardware_shops_screen.dart';
import '../screens/shops/flooring_shops_screen.dart';
import '../screens/shops/electrical_shops_screen.dart';
import '../screens/shops/brick_shops_screen.dart';
import '../screens/shops/aggregate_shops_screen.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          elevation: 5,
          title: Text(
            'Shops',
            style: GoogleFonts.roboto(
              color: Color(0xff003366),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Color(0xff003366),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "HARD WARE",
              ),
              Tab(
                text: "FLOORING",
              ),
              Tab(
                text: "ELECTRICAL",
              ),
              Tab(
                text: "BRICKS",
              ),
              Tab(
                text: "AGGREGATES",
              ),
            ],
            labelColor: Color(
              0xff003366,
            ),
            indicator: MaterialIndicator(
              tabPosition: TabPosition.bottom,
              horizontalPadding: 10,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            HardWareShopScreen(),
            FlooringShopScreen(),
            ElectricalShopScreen(),
            BrickShopScreen(),
            AggregateShopScreen(),
          ],
        ),
      ),

      // child: Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     title: Text(
      //       'Shops',
      //       style: GoogleFonts.roboto(
      //         color: Color(
      //           0xff003366,
      //         ),
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     bottom: TabBar(
      //       labelColor: Color(
      //         0xff003366,
      //       ),
      //       indicator: RectangularIndicator(
      //         // bottomLeftRadius: 100,
      //         // bottomRightRadius: 100,
      //         // topLeftRadius: 100,
      //         // topRightRadius: 100,
      //         paintingStyle: PaintingStyle.stroke,
      //       ),
      //       tabs: [
      //         Tab(
      //           text: 'Hard Ware',
      //         ),
      //         Tab(
      //           text: 'Hard Ware',
      //         ),
      //         Tab(
      //           text: 'Hard Ware',
      //         ),
      //         Tab(
      //           text: 'Hard Ware',
      //         ),
      //         Tab(
      //           text: 'Hard Ware',
      //         ),
      //         Tab(
      //           text: 'Hard Ware',
      //         ),
      //       ],
      //     ),
      //   ),
      //   body: TabBarView(
      //     children: [
      //       EngineerCategoryScreen(),
      //       EngineerCategoryScreen(),
      //       EngineerCategoryScreen(),
      //       EngineerCategoryScreen(),
      //       EngineerCategoryScreen(),
      //       EngineerCategoryScreen(),
      //     ],
      //   ),
      // ),
    );
  }
}
