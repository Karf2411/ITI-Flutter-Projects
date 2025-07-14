import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/book_model.dart';

Future<List<Book>> getBooks() async {
  List<Book> books = [];

  try {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length && i < 10; i++) {
        var item = data[i];
        books.add(Book(
          id: item['id'],
          title: item['title'],
          author: 'Author ${item['id']}', // مش موجود ف ال api
          price: 15.0 + (item['id'] * 5.0), //مش موجود ف ال api
          description: (item['body']).substring(0, 40) + '...',
        ));
      }
    }
  } catch (e) {
    throw Exception('Failed to fetch books: $e');
  }

  return books;
}
