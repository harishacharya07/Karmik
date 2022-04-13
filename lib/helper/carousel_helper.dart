import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';

class CarouselHelper {
  static List<String> items = [
    'https://www.darnells.co.uk/wp-content/uploads/2016/07/Building-and-Construction.jpg',
    'https://tse1.mm.bing.net/th?id=OIP.0gYM2pRawHcv30TyOEzF7QHaE8&pid=Api&P=0&w=279&h=186',
    'https://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2013/10/10/1381390301087/Construction-workers-014.jpg',
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
