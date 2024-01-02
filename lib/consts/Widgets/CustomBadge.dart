import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/CartProvider.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Badge(
      label: Text(cartProvider.getCartitems.length.toString()),
      child: const Icon(
        IconlyLight.bag2,
      ),
    );
  }
}
