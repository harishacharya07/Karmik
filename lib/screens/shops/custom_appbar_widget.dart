import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;

  CustomAppBarWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(),
      preferredSize: Size.fromHeight(50),
    );
  }
}
