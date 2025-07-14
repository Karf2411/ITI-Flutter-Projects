import 'user_model.dart';
import 'book_model.dart';
import '../interfaces/printable.dart';

class Order implements Printable {
  final int orderId;
  final User user;
  final List<Book> books;

  Order({
    required this.orderId,
    required this.user,
    required this.books,
  });

  @override
  void printDetails() {
    print('Order ID: $orderId');
    print('User: ${user.name}');
    print('Books:');
    for (var book in books) {
      print('  - ${book.title} ( \$${book.price})');
    }
    print('-----------------------------');
  }
}
