import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractorDetailsScreen extends StatefulWidget {

  @override
  _ContractorDetailsScreenState createState() => _ContractorDetailsScreenState();
}

class _ContractorDetailsScreenState extends State<ContractorDetailsScreen> {
  final _name = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _place = TextEditingController();

  bool isLoading = false;

  var _engineers = [
    'Civil',
    'Plastering',
    'Flooring',
    'Electrification',
    'Plumbing',
    'Carpenter',
    'Mason',
    'Truss Work'
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
                onPressed: () async {
                  final response = await dataBaseRef.push().set({
                    'name': _name.text,
                    'mobileNumber': _mobileNumber.text,
                    'place': _place.text,
                    'taluk': _currentDis,
                  });
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
