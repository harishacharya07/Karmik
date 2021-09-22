import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';

class CarouselHelper {
  static List<String> items = [
    'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-'
        '1710578_1280.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C'
        '_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.'
        '022-8%29.jpg',
    'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  ];

  Future<void> fetch() async {
    var url = Uri.parse(
        'https://shop-app-5cc61-default-rtdb.firebaseio.com/products.json');
    final response = await http.get(url);
    final extractedData = json.encode(response.body) as Map<String, dynamic>;
    print(extractedData);
    extractedData.forEach(
          (productId, productValue) {
        items.add(
           productValue['imageUrl'],
        );
      },
    );
  }
}

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.imageUrl,
    this.isFavorite = false,
  });
}
