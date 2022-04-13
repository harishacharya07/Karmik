import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:karmik/screens/bottom_navigation_screen.dart';
import 'package:karmik/screens/creator/creator_login.dart';
import 'package:karmik/screens/home_screen.dart';
import 'package:karmik/screens/join/join_now_screen.dart';
import 'package:karmik/screens/join/labour_join_screen.dart';
import 'package:karmik/screens/join/otp_screen.dart';
import 'package:karmik/screens/join/professionals_deatails_screen.dart';
import 'package:karmik/screens/join/select_your_role_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithGoogleScreen extends StatefulWidget {
  static final routeName = '/login_screen';

  @override
  _LoginWithGoogleScreenState createState() => _LoginWithGoogleScreenState();
}

class _LoginWithGoogleScreenState extends State<LoginWithGoogleScreen> {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  bool signInLoading = false;

  Future<void> signIn() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('user', 'client');

    await FirebaseAuth.instance.signInWithCredential(credential);
    signInLoading = true;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return BottomNavigationScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/login.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome User',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Sign in or Join to continue',
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            ElevatedButton.icon(
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(MediaQuery.of(context).size.width * 0.9, 60),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white,
                ),
              ),
              onPressed: signIn,
              label: Text(
                'Sign in with google',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Align(
              child: Text(
                'or',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color(
                    0xff003366,
                  ),
                ),
                minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(
                    MediaQuery.of(context).size.width * 0.9,
                    50,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CreatorLogin();
                    },
                  ),
                );
              },
              child: Text(
                'Join Now',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
