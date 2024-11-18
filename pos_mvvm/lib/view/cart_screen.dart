import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/cart_viewmodel.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cart.cart.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
        children: [
          Expanded(
            child: ListView(
              children: cart.cart.entries.map((entry) {
                return ListTile(
                  title: Text('Item ID: ${entry.key}'),
                  subtitle: Text('Quantity: ${entry.value}'),
                  trailing: Text('Total: \$${entry.value * 10}'),
                );
              }).toList(),
            ),
          ),
          Text('Total Price: \$${cart.totalPrice}'),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Checkout not implemented!')),
              );
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
