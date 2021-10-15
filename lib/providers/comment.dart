import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:karmik/models/comment_model.dart';

import 'package:http/http.dart' as http;

class CommentProvider with ChangeNotifier {

  List<CommentModel> get comments {
    return [..._comments];
}

  List<CommentModel> _comments = [];

  Future<void> fetch(String id) async {
    var url = Uri.parse(
        'https://karmik-cb025-default-rtdb.firebaseio.com/migrant/$id/comments.json');
    final response = await http.get(url);
    final List<CommentModel> comment = [];
    print(json.decode(response.body));

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach(
      (productId, productValue) {
        comment.add(
          CommentModel(
            name: productValue['name'],
            comment: productValue['comment'],
            imageUrl: productValue['user'],
          ),
        );
      },
    );
    _comments = comment;
    notifyListeners();
  }
}
