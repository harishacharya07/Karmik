import 'package:flutter/material.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/widgets/machinery_widget.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static final routeName = '/detailsScreen';

  @override
  Widget build(BuildContext context) {

    final id = ModalRoute.of(context)!.settings.arguments.toString();

    final details = Provider.of<Labours>(context).findById(id);
    return Scaffold(
      body: Column(
        children: [
          Text(details.id),
          Text(details.imageUrl),
          Text(details.location),
        ],
      ),
    );

  }
}
