import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:karmik/screens/bottom_navigation_screen.dart';
import 'package:karmik/screens/home_screen.dart';

class LoginWithGoogleScreen extends StatefulWidget {
  static final routeName = '/login_screen';

  const LoginWithGoogleScreen({Key? key}) : super(key: key);

  @override
  _LoginWithGoogleScreenState createState() => _LoginWithGoogleScreenState();
}

class _LoginWithGoogleScreenState extends State<LoginWithGoogleScreen> {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  bool signInLoading = false;

  Future signIn() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    signInLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003366),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.08,
            ),
            child: Text(
              'Welcome User',
              style: GoogleFonts.roboto(
                color: Colors.white,
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
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
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
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
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ElevatedButton.icon(
            icon: FaIcon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith(
                (states) => Size(
                  MediaQuery.of(context).size.width * 0.9,
                  60,
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.blue,
              ),
            ),
            onPressed: () {},
            label: Text(
              'Sign in with Facebook',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
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
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 131,
                width: double.infinity,
                child: Card(
                  color: Color(0xff003366),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.white,
                  ),
                  minimumSize: MaterialStateProperty.resolveWith(
                    (states) => Size(
                      MediaQuery.of(context).size.width * 0.9,
                      50,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(BottomNavigationScreen.routeName);
                },
                child: Text(
                  'Join Now',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
