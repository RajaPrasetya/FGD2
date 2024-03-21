import 'package:fgd_2/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/title.png',
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'Rp ${cartData.totalHarga}',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 800),
            child: ListView.builder(
              itemCount: cartData.totalItem,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(cartData.items.values.toList()[index].id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Color(0xFFBD8456),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.delete,
                    ),
                  ),
                  confirmDismiss: (DismissDirection direction) async {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Konfirmasi'),
                          content: const Text(
                              'Apakah Anda Yakin Ingin Menghapus Kue ini?'),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFBD8456)),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Produk Berhasil Dihapus'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                cartData.deleteItem(
                                    cartData.items.values.toList()[index].id);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Ya",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tidak"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    title:
                        Text('${cartData.items.values.toList()[index].title}'),
                    subtitle: Text(
                        'Quantity: ${cartData.items.values.toList()[index].qty} \nHarga: ${cartData.items.values.toList()[index].price.toInt()}'),
                    trailing: IconButton(
                      onPressed: () {
                        cartData.deleteItem(
                            cartData.items.values.toList()[index].id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
