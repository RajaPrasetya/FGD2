import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //TODO: ADD Product
  void addProduct(
      String productName, String description, String imagePath, int price) {
    final product = <String, dynamic>{
      "name": productName,
      "description": description,
      "image": imagePath,
      "price": price,
    };
    try {
      db.collection('products').add(product).then((value) =>
          print('Product Berhasil Ditambahkan dengan ID: ${value.id}'));
    } catch (err) {
      print('Error : $err');
    }
  }
}
