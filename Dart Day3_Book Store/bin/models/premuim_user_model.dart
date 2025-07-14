import 'user_model.dart';
import '../interfaces/discountable.dart';

class PremiumUser extends User implements Discountable {
  PremiumUser({
    required super.name,
    required super.email,
    super.purchasedBooks,
  });

  @override
  double applyDiscount(double price) {
    return price * 0.9;
  }
}
