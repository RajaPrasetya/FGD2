import 'package:fgd_2/data/product.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/title.png',
          height: 50,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Image.asset(widget.product.image),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset('assets/star.png', width: 20, height: 20),
                      SizedBox(width: 5),
                      Text('4.8', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/truk.png', width: 20, height: 20),
                      SizedBox(width: 5),
                      Text('Free', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/clock.png', width: 20, height: 20),
                      SizedBox(width: 5),
                      Text('20 min', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(widget.product.description),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('SIZE:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Text('10"',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFBD8456),
                      shape: BoxShape.circle,
                    ),
                    child: Text('14"',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Text('16"',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Price',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.product.price,
                      style: TextStyle(fontSize: 20, color: Color(0xFFBD8456))),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: decreaseQuantity,
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '$quantity',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                              IconButton(
                                onPressed: increaseQuantity,
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,),
             ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: Color(0xFFBD8456)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ADD TO CART',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
