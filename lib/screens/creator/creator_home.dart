import 'package:flutter/material.dart';

class CreatorHomeScreen extends StatelessWidget {
  const CreatorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        tooltip: 'Add Post',
        child: Center(
          child: Icon(
            Icons.add,
            color: Color(
              0xff003366,
            ),
          ),
        ),
        onPressed: () {},
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
