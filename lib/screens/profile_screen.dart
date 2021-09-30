import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Color(
              0xff003366,
            ),
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("${user.photoURL}"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline,),
                      title: Text('${user.displayName}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email,),
                      title: Text('${user.email}'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout,),
                      title: Text('Log Out'),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
