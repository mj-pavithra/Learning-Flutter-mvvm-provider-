import 'package:flutter/foundation.dart';
import '../data/item.dart';

class CartViewModel extends ChangeNotifier {
  final Map<String, int> _cart = {};

  Map<String, int> get cart => _cart;

  void addItem(Item item) {
    if (_cart.containsKey(item.id)) {
      _cart[item.id] = _cart[item.id]! + 1;
    } else {
      _cart[item.id] = 1;
    }
    notifyListeners();
  }

  void removeItem(Item item) {
    if (_cart.containsKey(item.id) && _cart[item.id]! > 1) {
      _cart[item.id] = _cart[item.id]! - 1;
    } else {
      _cart.remove(item.id);
    }
    notifyListeners();
  }

  double get totalPrice {
    // Simulating prices for simplicity
    return _cart.entries.fold(0.0, (sum, entry) {
      return sum + (entry.value * 10.0); // Assume each item costs 10.0
    });
  }
}
