import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HorizontalCategory()));
}

class HorizontalCategory extends StatelessWidget {
  const HorizontalCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            buildCategory("Home", Colors.blue),
            buildCategory("Fashion", Colors.pink),
            buildCategory("Tech", Colors.green),
            buildCategory("Beauty", Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(String title, Color color) {
    return Container(
      height: 85,
      width: 85,
      padding: EdgeInsets.symmetric(vertical: 16),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
