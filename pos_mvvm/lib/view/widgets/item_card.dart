import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/item.dart';
import '../../viewmodel/cart_viewmodel.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text('\$${item.price}'),
        trailing: ElevatedButton(
          onPressed: () {
            context.read<CartViewModel>().addItem(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${item.name} added to cart')),
            );
          },
          child: const Text('Add to Cart'),
        ),
      ),
    );
  }
}
