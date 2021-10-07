import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/screens/machinery/concrete_mixer.dart';
import 'package:karmik/screens/machinery/loaders_screen.dart';
import 'package:karmik/widgets/category_item_widget.dart';
import 'package:karmik/widgets/loading_widget.dart';
import 'package:karmik/widgets/machinery_widget.dart';
import 'package:provider/provider.dart';

class EngineerCategoryScreen extends StatefulWidget {
  static final routeName = '/engineer_category';

  @override
  _EngineerCategoryScreenState createState() => _EngineerCategoryScreenState();
}

class _EngineerCategoryScreenState extends State<EngineerCategoryScreen> {
  List<String> _engineers = [
    'Civil',
    'structural',
    'geotechnical',
    'Highway',
    'management',
  ];
  var valueSelected = "geotechnical";

  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Labours>(context).fetch(valueSelected).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> update() async {
    Provider.of<Labours>(context).fetch(valueSelected);
  }

  @override
  Widget build(BuildContext context) {
    final _engineer = Provider.of<Labours>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Center(
            child: DropdownButton(
              underline: Container(
                color: Colors.transparent,
              ),
              //dropdownColor: Color(0xff003366),
              items: _engineers.map(
                (String newValue) {
                  return DropdownMenuItem(
                    value: newValue,
                    child: Text(
                      newValue,
                      style: GoogleFonts.roboto(
                        color: Color(
                          0xff003366,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              onChanged: (String? newValueSelected) {
                setState(
                  () {
                    valueSelected = newValueSelected.toString();
                    _isInit = true;
                  },
                );
              },
              value: valueSelected,
            ),
          ),
        ],
        title: Text(
          'Categories',
          style: GoogleFonts.roboto(
              color: Color(
                0xff003366,
              ),
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: FutureBuilder(
        future: update(),
        builder: (context, snapShot) {
          return _isLoading
              ? LoadingWidget()
              : ListView.builder(
                  itemCount: _engineer.labours.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        MachineryWidget(
                          id: _engineer.labours[index].id,
                          imageUrl: _engineer.labours[index].imageUrl,
                          title: _engineer.labours[index].name,
                          location: _engineer.labours[index].location,
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
