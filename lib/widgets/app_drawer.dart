import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Divider(),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.home),
            focusColor: Color(0xff003366),
            title: Text('Home'),
          ),
        ],
      ),
    );
  }
}
