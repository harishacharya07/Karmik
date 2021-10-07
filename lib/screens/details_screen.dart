import 'package:flutter/material.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/widgets/machinery_widget.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static final routeName = '/detailsScreen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    final details = Provider.of<Labours>(context).findById(id);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: details.id,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    details.imageUrl,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(details.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
