import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/widgets/labour_widget.dart';
import 'package:karmik/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class MigrantLabourScreen extends StatefulWidget {
  static final routeName = '/labourScreen';

  @override
  _MigrantLabourScreenState createState() => _MigrantLabourScreenState();
}

class _MigrantLabourScreenState extends State<MigrantLabourScreen> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments.toString();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Labours>(context).fetch("geotechnical").then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final labour = Provider.of<Labours>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Migrant Labour',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Color(
              0xff003366,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? LoadingWidget()
          : ListView.builder(
              itemCount: labour.labours.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    LabourWidget(
                      name: labour.labours[index].name,
                      //age: '25',
                      // experience: labour.labours[index].experience,
                      // location: labour.labours[index].location,
                      // imageUrl: labour.labours[index].imageUrl,
                      //mobileNumber: '72582222822',
                      //price: labour.labours[index].name,
                      //gender: 'male',
                      id: labour.labours[index].id,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
