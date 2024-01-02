import 'package:flutter/material.dart';
import 'package:shop_smart/Models/wishList-model.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishListModel> wishListItems = {};
  Map<String, WishListModel> get getWishList {
    return wishListItems;
  }

  void addOrRemoveLocal({required String productId}) {
    if (wishListItems.containsKey(productId)) {
      wishListItems.remove(productId);
    } else {
      wishListItems.putIfAbsent(productId,
          () => WishListModel(id: const Uuid().v4(), productId: productId));
    }
    notifyListeners();
  }

  bool isProductInWishlist({required String productId}) {
    return wishListItems.containsKey(productId);
  }

  void clearAllItemLocal() {
    wishListItems.clear();
    notifyListeners();
  }
}
