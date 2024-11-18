import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/item.dart';
import '../view/widgets/item_card.dart';
import '../viewmodel/cart_viewmodel.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final List<Item> items = [
    Item(id: '1', name: 'Apple', price: 10.0),
    Item(id: '2', name: 'Banana', price: 5.0),
    Item(id: '3', name: 'Orange', price: 8.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POS System'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
    );
  }
}
