import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karmik/widgets/imge_picker_widget.dart';

class ProfessionalDetailsScreen extends StatefulWidget {
  static final routeName = '/professional';

  @override
  _ProfessionalDetailsScreenState createState() =>
      _ProfessionalDetailsScreenState();
}

class _ProfessionalDetailsScreenState extends State<ProfessionalDetailsScreen> {
  final _name = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _place = TextEditingController();

  late String imageUrl;

  var _engineers = [
    'management',
    'geotechnical',
    'structural',
    'trasportation',
    'environmental',
    'highway'
  ];

  var _dist = [
    'Udupi',
    'Kapu',
    'Kundapur',
    'Karkala',
    'Hebri',
  ];

  var _currentValueSelected = 'management';
  var _currentDis = 'Udupi';

  File? _selectedImage;
  final imagePicker = ImagePicker();

  Future _getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img == null) return;

    final pickedImage = File(img.path);

    setState(() {
      _selectedImage = pickedImage;
    });
  }

  final snackBar = SnackBar(
    content: Text('Fill all the details'),
  );

  bool _isLoading = false;

  _sendData() async {
    final dataBaseRef =
        FirebaseDatabase.instance.reference().child(_currentValueSelected);

    try {
      setState(() {
        _isLoading = true;
      });

      if (_name.text.isEmpty ||
          _place.text.isEmpty ||
          _mobileNumber.text.isEmpty ||
          _selectedImage!.path.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {

        var storageImage =
            FirebaseStorage.instance.ref().child(_selectedImage!.path);
        var task = storageImage.putFile(_selectedImage!);
        imageUrl = await storageImage.getDownloadURL();

        var response = await dataBaseRef.push().set({
          'name': _name.text,
          'imageUrl': imageUrl,
          'place': _place.text,
          'mobileNumber': _mobileNumber.text,
        });
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Enter Details',
          style: GoogleFonts.roboto(
            color: Color(0xff003366),
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: TextFormField(
                controller: _name,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: TextFormField(
                controller: _mobileNumber,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Mobile number',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: DropdownButton(
                hint: Text('Profession'),
                isExpanded: true,
                items: _engineers.map((String newValue) {
                  return DropdownMenuItem(
                    value: newValue,
                    child: Text(newValue),
                  );
                }).toList(),
                onChanged: (String? newValueSelected) {
                  setState(() {
                    _currentValueSelected = newValueSelected!;
                  });
                },
                value: _currentValueSelected,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: DropdownButton(
                hint: Text('Profession'),
                isExpanded: true,
                items: _dist.map((String newValue) {
                  return DropdownMenuItem(
                    value: newValue,
                    child: Text(newValue),
                  );
                }).toList(),
                onChanged: (String? newValueSelected) {
                  setState(() {
                    _currentDis = newValueSelected!;
                  });
                },
                value: _currentDis,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: TextFormField(
                controller: _place,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Place',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: InkWell(
                onTap: () {
                  _getImage();
                },
                child: _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      )
                    : ImagePickerWidget(_getImage),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Color(0xff003366),
                  ),
                ),
                onPressed: _sendData,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Submit',
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
