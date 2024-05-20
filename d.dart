/* 
      Dependency Inversion Principle

      - high level module should not depends on low level modules
        and low level modules should not depends on high level modules
        both should depends on abstraction but the abstraction should not
        depends on details but the details should depends on abstraction
*/

/*
high level module should not depends on low level modules
*/

/*
Highlevel Module
*/
// class Resturant {

//   BankPaymentGateway bankPaymentGateway;
//   Resturant(this.bankPaymentGateway);
//   void makePayment(double amount) {
//     bankPaymentGateway.handlePayment(amount);
//   }
// }
/*
Lowlevel Module
*/

// class BankPaymentGateway {

//   void handlePayment(double amount) {
//     print("Make Payment $amount");
//   }
// }

/* 
if you want to change payment gateway you 
need to change the resturant class 
*/

/*
low level module should not depends on high level modules
*/

// class BankPaymentGateway {
//   Resturant resturant;
//   BankPaymentGateway(this.resturant);
//   void handlePayment(double amount) {
//     resturant.makePayment(amount);
//   }
// }

// class Resturant {
//   void makePayment(double amount) {
//     print("Make Payment $amount");
//   }
// }

/* 
if you want to change Resturant class  we would 
need to make change BankPaymentGateway class
*/

// After Dependency Inversion

abstract class PaymentGateway {
  void handlePayment(double amount);
}

class CreditCardPayment implements PaymentGateway {
  @override
  void handlePayment(double amount) {
    // Credit Card Payment logic here
  }
}

class BankPaymentGateway implements PaymentGateway {
  @override
  void handlePayment(double amount) {
    // Bank Payment logic here
  }
}

class Resturant {
  PaymentGateway paymentGateway;
  Resturant(this.paymentGateway);

  void makePayment(double amount) {
    paymentGateway.handlePayment(amount);
  }
}
