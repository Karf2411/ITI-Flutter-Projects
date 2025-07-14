import '../interfaces/printable.dart';
import 'book_model.dart';

class User implements Printable {
  final String name;
  final String email;
  final List<Book> purchasedBooks;

  User({
    required this.name,
    required this.email,
    List<Book>? purchasedBooks,
  }) : purchasedBooks = purchasedBooks ?? [];

  @override
  void printDetails() {
    print('User: $name');
    print('Email: $email');
    print('Purchased Books:');
    if (purchasedBooks.isEmpty) {
      print('  No books purchased yet.');
    } else {
      for (var book in purchasedBooks) {
        print('  - ${book.title}');
      }
    }
    print('-----------------------------');
  }
}
