import 'package:fgd_2/providers/product.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  var productC = TextEditingController();
  var descriptionC = TextEditingController();
  var imageC = TextEditingController();
  var priceC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: productC,
              decoration: InputDecoration(
                labelText: 'Product Name',
                hintText: 'Product Name...',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: descriptionC,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Description...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: imageC,
                decoration: InputDecoration(
                  labelText: 'Image Path',
                  hintText: 'Image Path...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: priceC,
                decoration: InputDecoration(
                  labelText: 'Price',
                  hintText: 'Price...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: LinearBorder(),
                  padding: EdgeInsets.all(26),
                ),
                onPressed: () {
                  Product().addProduct(
                    productC.text,
                    descriptionC.text,
                    imageC.text,
                    int.parse(priceC.text),
                  );
                },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
