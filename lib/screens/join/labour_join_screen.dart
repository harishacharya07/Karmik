import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karmik/widgets/imge_picker_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabourJoinScreen extends StatefulWidget {
  const LabourJoinScreen({Key? key}) : super(key: key);

  @override
  _LabourJoinScreenState createState() => _LabourJoinScreenState();
}

class _LabourJoinScreenState extends State<LabourJoinScreen> {
  final _name = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _place = TextEditingController();
  final _age = TextEditingController();
  final _experience = TextEditingController();
  final _gender = TextEditingController();

  late String imageUrl;

  var _type = [
    'migrant',
    'local',
  ];

  var _currentValueSelected = 'migrant';

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

  String name = '';

  final snackBar = SnackBar(
    content: Text('Fill all the details'),
  );

  bool _isLoading = false;

  Future<void> _sendData() async {
    final _auth = FirebaseAuth.instance.currentUser!.uid;
    final dataBaseRef =
        FirebaseDatabase.instance.reference().child(_currentValueSelected);

    try {
      setState(() {
        _isLoading = true;
      });

      if (_name.text.isEmpty ||
          _place.text.isEmpty ||
          _mobileNumber.text.isEmpty ||
          _selectedImage!.path.isEmpty ||
          _experience.text.isEmpty ||
          _age.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var storageImage =
            FirebaseStorage.instance.ref().child(_selectedImage!.path);
        var task = storageImage.putFile(_selectedImage!);
        imageUrl = await storageImage.getDownloadURL();

        var response = await dataBaseRef.child(_auth).set({
          'name': _name.text,
          'imageUrl': imageUrl.toString(),
          'place': _place.text,
          'mobileNumber': _mobileNumber.text,
          'age': _age.text,
          'experience': _experience.text,
          'type': _currentValueSelected,
        });
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user", 'creator');

    name = prefs.getString('user')!;
  }

  @override
  Widget build(BuildContext context) {
    final dataBaseRef =
        FirebaseDatabase.instance.reference().child(_currentValueSelected);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 50,
                left: 10,
              ),
              child: Text(
                'Enter Details',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: TextFormField(
                controller: _age,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Age',
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
                controller: _experience,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Experience',
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
                items: _type.map((String newValue) {
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
                bottom: 10,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Color(0xff003366),
                  ),
                ),
                onPressed: _sendData,
                // onPressed: () async {
                //   var response = await dataBaseRef.push().set({
                //     'name': _name.text,
                //     'place': _place.text,
                //     'mobileNumber': _mobileNumber.text,
                //     'age': _age.text,
                //     'experience': _experience.text,
                //     'type': _currentValueSelected,
                //   });
                // },
                child:
                    _isLoading ? CircularProgressIndicator() : Text('Submit'),
              ),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
