import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/models/labours_model.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/widgets/labour_widget.dart';
import 'package:karmik/widgets/loading_widget.dart';
import 'package:karmik/widgets/machinery_widget.dart';
import 'package:provider/provider.dart';

class PlasteringScreen extends StatefulWidget {
  static final routeName = '/plastering';

  @override
  _PlasteringScreenState createState() => _PlasteringScreenState();
}

class _PlasteringScreenState extends State<PlasteringScreen> {
  var _isLoading = false;
  var _isInit = true;
  var args;

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments.toString();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Labours>(context).fetch(args).then((value) {
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
        title: Text(
          'Labors',
          style: GoogleFonts.roboto(
            color: Color(0xff003366),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: labour.labours.isEmpty
          ? Center(
              child: Text('No Data Available'),
            )
          : _isLoading
              ? LoadingWidget()
              : ListView.builder(
                  itemCount: labour.labours.length,
                  itemBuilder: (context, index) {
                    return labour.labours.isEmpty
                        ? Center(
                            child: Image.asset('assets/images/login.png'),
                          )
                        : Column(
                            children: [
                              // ListTile(
                              //   leading: Image.network(labour.labours[index].imageUrl,),
                              // )
                              MachineryWidget(
                                id: labour.labours[index].id,
                                imageUrl: labour.labours[index].imageUrl,
                                title: labour.labours[index].name,
                                location: labour.labours[index].location,
                                wage: labour.labours[index].price,
                              ),
                              // print()
                            ],
                          );
                  },
                ),
    );
  }
}
