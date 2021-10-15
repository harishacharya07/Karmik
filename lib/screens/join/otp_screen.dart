import 'dart:async';
import 'package:karmik/screens/creator/creator_dash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karmik/screens/join/select_your_role_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final mobileNumber;

  OtpScreen(this.mobileNumber);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _verificationCode = '';

  late final AnimationType animationType;
  TextEditingController textEditingController = TextEditingController();
  final auth = FirebaseAuth.instance;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Future<void> verifyPhoneNumber(String number, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$number',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
              (value) async => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return CreatorDashScreen();
                    },
                  ),
                ),
              },
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      timeout: Duration(
        seconds: 60,
      ),
    );
  }

  @override
  void initState() {
    verifyPhoneNumber(widget.mobileNumber, context);
    super.initState();
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              controller: textEditingController,
              onCompleted: (v) async {
                await FirebaseAuth.instance.signInWithCredential(
                  PhoneAuthProvider.credential(
                    verificationId: _verificationCode,
                    smsCode: v,
                  ),
                );
              },
              onChanged: (value) {
                print(value);
                setState(() {
                  var currentText = value;
                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
              appContext: context,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final code = textEditingController.text.trim();
              AuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: _verificationCode, smsCode: code);

              final result = await auth.signInWithCredential(credential);
              final user = result.user;

              if (user != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CreatorDashScreen();
                    },
                  ),
                );
              } else {
                print("Error");
              }
            },
            child: Text('Name'),
          ),
        ],
      ),
    );
  }
}
