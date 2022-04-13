import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:karmik/screens/creator/creator_dash_screen.dart';
import 'package:karmik/screens/join/labour_join_screen.dart';
import 'package:karmik/screens/join/select_your_role_screen.dart';

class CreatorLogin extends StatefulWidget {
  const CreatorLogin({Key? key}) : super(key: key);

  @override
  _CreatorLoginState createState() => _CreatorLoginState();
}

class _CreatorLoginState extends State<CreatorLogin> {

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

    await FirebaseAuth.instance.signInWithCredential(credential);
    signInLoading = true;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return LabourJoinScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: signIn,
            icon: Icon(FontAwesomeIcons.google),
            label: Text('Login'),
          )
        ],
      ),
    );
  }
}
