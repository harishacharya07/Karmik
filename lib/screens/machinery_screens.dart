import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:karmik/widgets/loading_widget.dart';

import '../widgets/machinery_category_widget.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../providers/machinery.dart';

import '../widgets/machinery_widget.dart';

class MachineryScreen extends StatefulWidget {
  @override
  _MachineryScreenState createState() => _MachineryScreenState();
}

class _MachineryScreenState extends State<MachineryScreen> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Machinery>(context).fetch().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final machinery = Provider.of<Machinery>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Machinery',
          style: GoogleFonts.roboto(
            color: Color(
              0xff003366,
            ),
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: machinery.fetch,
      //     child: null,
      //   ),
      // ),
      //body: MachineryCategoryWidget(imageUrl: machinery.items[2].imageUrl),
      body: _isLoading
          ? LoadingWidget()
          : MachineryCategoryWidget(
              imageUrl: machinery.items[2].imageUrl,
            ),
    );
  }
}
