import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ProductList()));
}

class ProductList extends StatelessWidget {
  final List<Map> products = [
    {'name': 'Laptop', 'price': '\$799', 'image': 'assets/images/laptop.jpg'},
    {
      'name': 'Smartphone',
      'price': '\$499',
      'image': 'assets/images/smartphone.jpg',
    },
    {
      'name': 'Headphones',
      'price': '\$199',
      'image': 'assets/images/headphone.jpg',
    },
    {'name': 'Camera', 'price': '\$899', 'image': 'assets/images/camera.jpg'},
    {
      'name': 'Keyboard',
      'price': '\$99',
      'image': 'assets/images/keyboard.jpg',
    },
    {'name': 'Watch', 'price': '\$299', 'image': 'assets/images/watch.jpg'},
  ];

  ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrollable Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(
                    product['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        product['price'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
