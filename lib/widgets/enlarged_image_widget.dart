import 'package:flutter/material.dart';

class EnlargedImageWidget extends StatelessWidget {
  const EnlargedImageWidget({Key? key}) : super(key: key);

  static final routeName = '/enlarged';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Hero(
          tag: args,
          child: Image.network(
            args,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
