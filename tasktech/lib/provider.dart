import 'package:flutter/material.dart';
import 'modelpro.dart';

class CartProvider extends ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => _items;

  void addToCart(Product product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void changeQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      _items.remove(product);
    } else {
      _items[product] = quantity;
    }
    notifyListeners();
  }

  double get totalPrice {
    return _items.entries
        .map((e) => e.key.price * e.value)
        .fold(0.0, (a, b) => a + b);
  }
}