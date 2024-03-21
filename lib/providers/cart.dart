import 'package:fgd_2/models/cart_item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get totalItem {
    return _items.length;
  }

  int get totalHarga {
    var total = 0;
    _items.forEach((key, value) {
      total += value.qty * value.price.toInt();
    });
    return total;
  }

  void addCart(String productID, String name, double price, int qty) {
    if (_items.containsKey(productID)) {
      //! jika productID sudah tersedia
      _items.update(
          productID,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty + qty));
    } else {
      //! nambah productID baru
      _items.putIfAbsent(productID,
          () => CartItem(id: productID, title: name, price: price, qty: qty));
    }
    notifyListeners();
  }

  void deleteItem(String productID) {
    _items.removeWhere((key, value) => value.id == productID);
    notifyListeners();
  }
}
