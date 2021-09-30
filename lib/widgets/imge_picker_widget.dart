import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ImagePickerWidget extends StatelessWidget {

  Function _imagePicker;
  ImagePickerWidget(this._imagePicker);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton.icon(
        onPressed: () {
          _imagePicker();
        },
        style: ButtonStyle(),
        icon: Icon(
          FontAwesomeIcons.plus,
          color: Color(0xff003366),
        ),
        label: Text(
          'Upload Image',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Color(0xff003366, ),
          ),
        ),
      ),
    );
  }
}
