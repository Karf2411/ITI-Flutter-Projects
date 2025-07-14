import 'services/api_servece.dart';
import 'models/book_model.dart';
import 'models/user_model.dart';
import 'models/premuim_user_model.dart';
import 'models/order_model.dart';
import 'utils/input_helper.dart';

void main(List<String> arguments) async {
  print('Welcome to Dart Bookstore');
  print('===========================');

  List<Book> books = [];
  List<User> users = [];
  List<Order> orders = [];
  int orderCounter = 1;

  while (true) {
    print('\nPlease choose an option:');
    print('1. View available books');
    print('2. Register a user');
    print('3. Purchase books');
    print('4. View order history');
    print('5. Exit');
    int? choice = InputHelper.getInt('Enter your choice: ');

    switch (choice) {
      case 1:
        print('\n=== Available Books ===');
        try {
          books = await getBooks();
          print('Books fetched successfully!\n');
        } catch (e) {
          print('Error fetching books: $e');
          break;
        }
        if (books.isEmpty) {
          print('No books available at the moment.');
        } else {
          for (var book in books) {
            book.printDetails();
          }
        }
        break;
      case 2:
        print('\n=== Register a User ===');
        String name = InputHelper.getString('Enter your name: ');
        if (name.isEmpty) {
          print('Name cannot be empty.');
          break;
        }
        String email = InputHelper.getString('Enter your email: ');
        if (email.isEmpty) {
          print('Email cannot be empty.');
          break;
        }
        // Check for duplicate email
        bool exists = false;
        for (var user in users) {
          if (user.email == email) {
            exists = true;
            break;
          }
        }
        if (exists) {
          print('A user with this email already exists.');
          break;
        }
        bool isPremium = InputHelper.getYesNo('Are you a premium user?');
        User user;
        if (isPremium) {
          user = PremiumUser(name: name, email: email);
          print('Premium user registered successfully!');
        } else {
          user = User(name: name, email: email);
          print('Regular user registered successfully!');
        }
        users.add(user);
        break;
      case 3:
        print('\n=== Purchase Books ===');
        if (users.isEmpty) {
          print('No users registered. Please register a user first.');
          break;
        }
        if (books.isEmpty) {
          print('No books available. Please view available books first.');
          break;
        }
        String email = InputHelper.getString('Enter your email: ');
        User? user;
        for (var u in users) {
          if (u.email == email) {
            user = u;
            break;
          }
        }
        if (user == null) {
          print('User not found. Please register first.');
          break;
        }
        print('Available books:');
        for (var book in books) {
          print('[ID: ${book.id}] ${book.title} - \$${book.price}');
        }
        List<int> bookIds = InputHelper.getIntList(
            'Enter book IDs to purchase (comma-separated): ');
        List<Book> selectedBooks = [];
        for (var id in bookIds) {
          Book? book;
          for (var b in books) {
            if (b.id == id) {
              book = b;
              break;
            }
          }
          if (book != null) {
            selectedBooks.add(book);
          } else {
            print('Book with ID $id not found.');
          }
        }
        if (selectedBooks.isEmpty) {
          print('No valid books selected.');
          break;
        }
        double total = selectedBooks.fold(0.0, (sum, book) => sum + book.price);
        double finalPrice = total;
        if (user is PremiumUser) {
          print('Original price: \$${total.toStringAsFixed(1)}');
          print('Premium discount applied: 10%');
          finalPrice = user.applyDiscount(total);
          print('Final price: \$${finalPrice.toStringAsFixed(1)}');
        } else {
          print('Total price: \$${total.toStringAsFixed(1)}');
        }
        int orderId = orderCounter;
        orders.add(Order(orderId: orderId, user: user, books: selectedBooks));
        orderCounter++;
        print('Order placed successfully! Order ID: ORD${orderId.toString()}');
        break;
      case 4:
        print('\n=== Order History ===');
        if (orders.isEmpty) {
          print('No orders found.');
        } else {
          for (var order in orders) {
            order.printDetails();
          }
        }
        break;
      case 5:
        print('Thank you for using Dart Bookstore. Goodbye!');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
