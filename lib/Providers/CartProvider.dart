import 'package:flutter/material.dart';
import 'package:shop_smart/Models/cart_model.dart';
import 'package:shop_smart/Models/product_models.dart';
import 'package:shop_smart/Providers/ProductProvider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartitems {
    return _cartItems;
  }

  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
          cartId: const Uuid().v4(), productId: productId, quantity: 1),
    );
    notifyListeners();
  }

  bool isProductInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  void ubdatequantity({required String productId, required int quantity}) {
    _cartItems.update(
      productId,
      (item) => CartModel(
          cartId: item.cartId, productId: productId, quantity: quantity),
    );
    notifyListeners();
  }

  double getTotla({required ProductProvider productProvider}) {
    double total = 0.0;

    _cartItems.forEach((key, value) {
      final ProductModel? getCurrentProduct =
          productProvider.findByProductId(value.productId);

      if (getCurrentProduct == null) {
        total;
      } else {
        total += double.parse(getCurrentProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  int getQuantity() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  void removeOneItem({required String producId}) {
    _cartItems.remove(producId);
    notifyListeners();
  }

  void clearLocalItems() {
    _cartItems.clear();
    notifyListeners();
  }
}
