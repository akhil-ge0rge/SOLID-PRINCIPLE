/*
Single Responsibility Principle
 */

// Before Single Responsibility Principle

// class Resturant {
//   void cookDish(String dish) {
//     print("Cooking " + dish);
//   }

//   void handlePayment(double amount, bool isBirthday) {
//     double discount = 0.0;
//     if (isBirthday) {
//       discount = 0.1 * amount;
//     }
//     double tax = 0.05 * amount;

//     double totalAmount = (amount - discount) + tax;
//     print(
//         " Payment $totalAmount amount with $tax Tax Amount and $discount Discount Amount");
//   }

// void cleanTable(int tableNo) {
//   print("Cleaning Table $tableNo");
// }
// }

// After Single Responsibility Principle

class Chef {
  void cookDish(String dish) {
    print("Cooking " + dish);
  }
}

class Cashier {
  void handlePayment(double amount, double discount, double tax) {
    double totalAmount = (amount - discount) + tax;
    print(
        "Payment $totalAmount amount with $tax Tax Amount and $discount Discount Amount");
  }
}

class DiscountManager {
  double calculateDiscount(double amount, bool isBirthday) {
    if (isBirthday) {
      return 0.01 * amount;
    }
    return 0.0;
  }
}

class TaxManager {
  double calculateTax(double amount) {
    return amount * 0.05;
  }
}

class Janitor {
  void cleanTable(int tableNo) {
    print("Cleaning Table $tableNo");
  }
}

void main() {
  double amount = 100;
  Cashier cashier = Cashier();
  DiscountManager discountManager = DiscountManager();
  TaxManager taxManager = TaxManager();

  double discountAmount = discountManager.calculateDiscount(amount, true);
  double taxAmount = taxManager.calculateTax(amount);
  cashier.handlePayment(amount, discountAmount, taxAmount);
}
