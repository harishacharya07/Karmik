import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
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
        title: Text('Name'),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: machinery.fetch,
      //     child: null,
      //   ),
      // ),
      body: _isLoading
          ? Center(
              child: SpinKitWave(
                color: Color(
                  0xff003366,
                ),
              ),
            )
          : ListView.builder(
              itemCount: machinery.items.length,
              itemBuilder: (context, index) => Column(
                children: [
                  MachineryWidget(
                    id: machinery.items[index].id,
                    imageUrl: machinery.items[index].imageUrl,
                    title: machinery.items[index].title,
                  ),
                ],
              ),
            ),
    );
  }
}
