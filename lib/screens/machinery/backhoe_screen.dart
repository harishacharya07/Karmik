import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:karmik/models/labours_model.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/screens/shops/custom_appbar_widget.dart';
import 'package:karmik/widgets/loading_widget.dart';
import 'package:karmik/widgets/machinery_widget.dart';
import 'package:provider/provider.dart';

class BackHoeScreen extends StatefulWidget {
  static final routeName = '/backhoe';

  @override
  _BackHoeScreenState createState() => _BackHoeScreenState();
}

class _BackHoeScreenState extends State<BackHoeScreen> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Labours>(context).fetch().then((value) {
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

    return ChangeNotifierProvider(
      create: (context) => Labours(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Back Hoe',
            style: GoogleFonts.roboto(
              color: Color(0xff003366),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: _isLoading
            ? LoadingWidget()
            : ListView.builder(
                itemCount: labour.labours.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      MachineryWidget(
                        id: labour.labours[index].id,
                        imageUrl: labour.labours[index].imageUrl,
                        title: labour.labours[index].name,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
