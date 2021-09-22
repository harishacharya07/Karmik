import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/machinery_model.dart';

class Machinery with ChangeNotifier {
  List<Product> _items = [
  ];

  List<Product> get items {
    return [..._items];
  }


  Future<void> fetch() async {
    var url = Uri.parse(
        'https://shop-app-5cc61-default-rtdb.firebaseio.com/products.json');
    final response = await http.get(url);
    final List<Product> loadedProduct = [];

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach(
          (productId, productValue) {
        loadedProduct.add(
          Product(
            id: productId,
            title: productValue['title'],
            imageUrl: productValue['imageUrl'],
          ),
        );
      },
    );
    _items = loadedProduct;
    notifyListeners();
  }
}