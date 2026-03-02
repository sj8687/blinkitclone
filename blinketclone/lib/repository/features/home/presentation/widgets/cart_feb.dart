import 'package:flutter/material.dart';

class CartFAB extends StatelessWidget {
  const CartFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text("View Cart • ₹240"),
      icon: const Icon(Icons.shopping_cart),
    );
  }
}