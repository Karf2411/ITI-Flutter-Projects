import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ProductGrid()));
}

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
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

  ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Grid')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children:
              products.map((product) {
                return Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        product['image'],
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),

                      SizedBox(height: 8),
                      Text(
                        product['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product['price'],
                        style: TextStyle(color: Colors.green[700]),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
