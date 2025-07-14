import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.phone_android, 'label': 'Electronics'},
    {'icon': Icons.checkroom, 'label': 'Fashion'},
    {'icon': Icons.book, 'label': 'Books'},
    {'icon': Icons.chair, 'label': 'Furniture'},
  ];

  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/smartphone.jpg',
      'title': 'Smart phones',
      'price': '\$199',
    },
    {
      'image': 'assets/images/headphone.jpg',
      'title': 'Headphones',
      'price': '\$149',
    },
    {'image': 'assets/images/camera.jpg', 'title': 'Camera', 'price': '\$499'},
    {'image': 'assets/images/watch.jpg', 'title': 'watchs', 'price': '\$89'},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyShop'), backgroundColor: Colors.blueAccent),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/banner.jpg',
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),

          // ✅ صف التصنيفات
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var cat in categories)
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue[100],
                          child: Icon(cat['icon'], color: Colors.blueAccent),
                        ),
                        SizedBox(height: 6),
                        Text(cat['label'], style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // ✅ عنوان المنتجات
          Text(
            'Featured Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          // ✅ شبكة المنتجات
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 1,
            children: [
              for (var product in products)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product['title'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product['price'],
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
