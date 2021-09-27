import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:karmik/models/labours_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/machinery_model.dart';

class Labours with ChangeNotifier {
  List<Labour> _labours = [];

  List<Labour> get labours {
    return [..._labours];
  }


  Future<void> fetch() async {
    var url = Uri.parse(
        'https://shop-app-5cc61-default-rtdb.firebaseio.com/products.json');
    final response = await http.get(url);
    final List<Labour> loadedProduct = [];

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach(
      (productId, productValue) {
        loadedProduct.add(
          Labour(
            name: productValue['title'],
            imageUrl: productValue['imageUrl'],
            location: productValue['imageUrl'],
            id: productId,
            experience: productValue['imageUrl'],
          ),
        );
      },
    );
    _labours = loadedProduct;
    notifyListeners();
  }
}
