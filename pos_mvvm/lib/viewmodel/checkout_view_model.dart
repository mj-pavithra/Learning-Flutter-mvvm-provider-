import 'package:flutter/material.dart';
import 'cart_view_model.dart';

class CheckoutViewModel extends ChangeNotifier {
  final CartViewModel cartViewModel;
  bool isProcessing = false;

  CheckoutViewModel(this.cartViewModel);

  bool get isCartEmpty => cartViewModel.items.isEmpty;

  double get totalAmount => cartViewModel.total;

  Future<void> checkout() async {
    if (isCartEmpty) return;

    isProcessing = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    cartViewModel.clearCart();
    isProcessing = false;
    notifyListeners();
  }
}
