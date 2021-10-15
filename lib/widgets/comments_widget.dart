import 'package:flutter/material.dart';

class CommentsWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String comment;

  CommentsWidget({
    required this.name,
    required this.comment,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: NetworkImage(imageUrl),
      ),
      title: Text(
        comment,
      ),
    );
  }
}
