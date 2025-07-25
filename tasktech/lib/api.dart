import 'dart:convert';
import 'package:http/http.dart' as http;

import 'modelpro.dart';

class ApiService {
  static const baseUrl = 'https://fakestoreapi.com/products';

  static Future<List<Product>> fetchProducts() async {
     final response = await http.get(Uri.parse(baseUrl));
       final List data = json.decode(response.body);
     return data.map((json) => Product.fromJson(json)).toList();
  }
   static Future<Product> fetchProductById(int id) async {

      final response = await http.get(Uri.parse('$baseUrl/$id'));
    return Product.fromJson(json.decode(response.body));
  }
}