import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Future<void> _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.mobileNumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
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
    _verifyPhoneNumber();
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,
              errorAnimationController: errorController,
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
            onPressed: _verifyPhoneNumber,
            child: Text('Name'),

          ),
        ],
      ),
    );
  }
}
