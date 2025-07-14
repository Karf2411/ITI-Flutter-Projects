import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username = 'Abdullah Samir';
  final String email = 'abdullah@email.com';
  final String avatarImage = 'assets/images/profile.png';

  final List<Map<String, String>> recentOrders = [
    {'title': 'Smart Watch', 'price': '\$199'},
    {'title': 'Headphones', 'price': '\$149'},
    {'title': 'Shoes', 'price': '\$89'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImage),
                      radius: 30,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(email, style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            Text(
              'Recent Orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Expanded(
              child: ListView.separated(
                itemCount: recentOrders.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final order = recentOrders[index];
                  return ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.blueAccent),
                    title: Text(order['title']!),
                    trailing: Text(
                      order['price']!,
                      style: TextStyle(color: Colors.green[700]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
