import 'package:flutter/material.dart';
import 'package:karmik/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import 'package:karmik/providers/machinery.dart';
import 'package:karmik/widgets/hardware_shops_widget.dart';

class HardWareShopScreen extends StatefulWidget {
  const HardWareShopScreen({Key? key}) : super(key: key);

  @override
  _HardWareShopScreenState createState() => _HardWareShopScreenState();
}

class _HardWareShopScreenState extends State<HardWareShopScreen> {
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
  Widget build(BuildContext context) {
    final machinery = Provider.of<Machinery>(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: 30,
          height: 30,
          child: Image(
            image: AssetImage(
              'assets/images/folder.png',
            ),
          ),
        ),
      ),
    );
  }
}
