import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DashboardGrid()));
}

class DashboardGrid extends StatelessWidget {
  final List<Map> items = [
    {'icon': Icons.person, 'label': 'Profile'},
    {'icon': Icons.settings, 'label': 'Settings'},
    {'icon': Icons.shopping_cart, 'label': 'Orders'},
    {'icon': Icons.inventory, 'label': 'Products'},
    {'icon': Icons.message, 'label': 'Messages'},
    {'icon': Icons.notifications, 'label': 'Alerts'},
  ];

  DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.extent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children:
              items.map((item) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: 40, color: Colors.blueAccent),
                        SizedBox(height: 10),
                        Text(
                          item['label'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
