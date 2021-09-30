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

  Labour findById(String id) {
    return _labours.firstWhere(
      (element) => element.id == id,
    );
  }

  Future<void> fetch() async {
    var url = Uri.parse(
        'https://karmik-cb025-default-rtdb.firebaseio.com/geotechnical.json');
    final response = await http.get(url);
    final List<Labour> loadedProduct = [];

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach(
      (productId, productValue) {
        loadedProduct.add(
          Labour(
            name: productValue['name'],
            imageUrl: productValue['imageUrl'],
            location: productValue['place'],
            id: productId,
            experience: productValue['taluk'],
          ),
        );
      },
    );
    _labours = loadedProduct;
    notifyListeners();
  }
}
