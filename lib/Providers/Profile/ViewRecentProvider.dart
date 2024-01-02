import 'package:flutter/material.dart';
import 'package:shop_smart/Models/viewRecentModel.dart';
import 'package:uuid/uuid.dart';

class ViewRecentProvider with ChangeNotifier {
  final Map<String, ViewRecentModel> viewRecentItems = {};
  Map<String, ViewRecentModel> get getViewRecentItems {
    return viewRecentItems;
  }

  void addViewRecentItems({required String productId}) {
    viewRecentItems.putIfAbsent(productId,
        () => ViewRecentModel(id: const Uuid().v4(), productid: productId));

    notifyListeners();
  }
}
