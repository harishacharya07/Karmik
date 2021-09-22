import 'package:flutter/material.dart';

class MachineryWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  MachineryWidget({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(title),
      ),
    );
  }
}
