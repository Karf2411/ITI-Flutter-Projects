import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ContactList()));
}

class ContactList extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'Abdullah', 'phone': '01000550411'},
    {'name': 'Sara', 'phone': '01111111111'},
    {'name': 'Omar', 'phone': '01222222222'},
  ];

  ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Icon(Icons.phone, color: Colors.green),
            title: Text(contact['name']!),
            subtitle: Text(contact['phone']!),
          );
        },
      ),
    );
  }
}
