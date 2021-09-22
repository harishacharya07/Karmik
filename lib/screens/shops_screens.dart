import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShopScreen extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                currentUser.photoURL!,
              ),
            ),
          ),
          Text(
            currentUser.displayName!,
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
