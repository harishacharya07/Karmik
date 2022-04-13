import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karmik/screens/join/labour_join_screen.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {},
            selectedTileColor: Colors.grey,
            leading: Icon(
              Icons.home_filled,
            ),
            focusColor: Color(0xff003366),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(LabourJoinScreen.routeName);
            },
            selectedTileColor: Color(0xFFACB7C4),
            leading: Icon(
              Icons.account_box_outlined,
            ),
            focusColor: Color(0xff003366),
            title: Text('Add'),
          ),
          ListTile(
            onTap: () {},
            selectedTileColor: Color(0xFFACB7C4),
            leading: Icon(
              Icons.help_center_outlined,
            ),
            focusColor: Color(0xff003366),
            title: Text('Help'),
          ),
          ListTile(
            onTap: () {},
            selectedTileColor: Color(0xFFACB7C4),
            leading: Icon(
              Icons.app_settings_alt_outlined,
            ),
            focusColor: Color(0xff003366),
            title: Text('More Apps'),
          ),
          ListTile(
            onTap: () {},
            selectedTileColor: Color(0xFFACB7C4),
            leading: Icon(
              Icons.feed,
            ),
            focusColor: Color(0xff003366),
            title: Text('Feed Back'),
          ),
        ],
      ),
    );
  }
}
