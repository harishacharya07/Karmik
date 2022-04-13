import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/screens/category/plastering.dart';
import 'package:karmik/screens/contractors/plastering_screen.dart';
import 'package:karmik/screens/join/professionals_deatails_screen.dart';

class DropDownSelectWidget extends StatefulWidget {
  const DropDownSelectWidget({Key? key}) : super(key: key);

  @override
  _DropDownSelectWidgetState createState() => _DropDownSelectWidgetState();
}

class _DropDownSelectWidgetState extends State<DropDownSelectWidget>
    with SingleTickerProviderStateMixin {
  var _dist = ['udupi', 'Mangalore'];
  var _hotSpots = ['City Busstand', 'Amabagilu', 'Katapadi', ];
  var _types = ['Kooli', 'Mason', 'Helper', 'Centring', 'General'];
  var _currentValueSelected = 'udupi';
  var _currentHotSpotSelected = 'City Busstand';
  var _currentTypeSelected = 'Kooli';

  bool _isSelectedDist = true;
  bool _isSelectedHotspot = true;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 500),
    );
    controller.forward().then((value) async {
      await Future.delayed(
        Duration(
          seconds: 5,
        ),
      );
    });
    controller.reverse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 30,
            ),
            child: ListTile(
              onTap: () => controller.forward().then((value) async {
                await Future.delayed(Duration(seconds: 1));
                controller.reverse();
              }),
              leading: Text(
                'Search',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: AnimatedIcon(
                icon: AnimatedIcons.search_ellipsis,
                color: Color(0xff003366),
                progress: controller,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 0,
              left: 30,
              right: 30,
            ),
            child: DropdownButton(
              hint: Text('Select District'),
              isExpanded: true,
              items: _dist.map(
                (String dist) {
                  return DropdownMenuItem(
                    child: Text(dist),
                    value: dist,
                  );
                },
              ).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _currentValueSelected = newValue!;
                  _isSelectedDist = false;
                });
              },
              value: _currentValueSelected,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30,
            ),
            child: DropdownButton(
              isExpanded: true,
              items: _hotSpots.map(
                (String hotSpot) {
                  return DropdownMenuItem(
                    child: Text(hotSpot),
                    value: hotSpot,
                  );
                },
              ).toList(),
              onChanged: _isSelectedDist
                  ? null
                  : (String? newValue) {
                      setState(() {
                        _currentHotSpotSelected = newValue!;
                        _isSelectedHotspot = false;
                      });
                    },
              value: _currentHotSpotSelected,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
            ),
            child: DropdownButton(
              isExpanded: true,
              items: _types.map(
                (String work) {
                  return DropdownMenuItem(
                    child: Text(work),
                    value: work,
                  );
                },
              ).toList(),
              onChanged: _isSelectedHotspot
                  ? null
                  : (String? newValue) {
                      setState(() {
                        _currentTypeSelected = newValue!;
                        _isSelectedHotspot = false;
                      });
                    },
              value: _currentTypeSelected,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(30),
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color(
                    0xff003366,
                  ),
                ),
              ),
              onPressed: _isSelectedHotspot
                  ? null
                  : () {
                      Navigator.of(context).pushNamed(
                          PlasteringScreen.routeName,
                          arguments: '$_currentValueSelected/$_currentHotSpotSelected/$_currentTypeSelected');
                    },
              child: Text(
                'Search',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
