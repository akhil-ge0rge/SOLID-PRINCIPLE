/* 
      Interface Segregation Principle

      - no client should be forced to depend on interface that 
        doesnot use

      - instead of having a large encompassing interface its often
        benficial to break it down into smaller and more specific
        interfaces 
      - so the clients only need to know about the
        methods are of interest to them
      - this ensure that implementing classes are not burdened by
        need to implement method that they do  not requir



*/

// Before Interface Segregation Principle
// void main(){

// }

// abstract class AllInOnePrinter{
//   void printDocument();
//   void scanDocument();
//   void faxDocument();
// }

//After Interface Segregation Principle

void main() {}

abstract class Printer {
  void printDocument() {}
}

abstract class Scanner {
  void scanDocument();
}

abstract class FaxMachine {
  void faxDocument();
}

//example 2

// Before Interface Segregation Principle

// abstract class Shape {
//   void area();
//   void perimeter();
//   void diagonal();
//   void numberOfEdge();
// }

// class Sqaure implements Shape {
//   @override
//   void area() {
//     // TODO: implement area
//   }

//   @override
//   void diagonal() {
//     // TODO: implement diagonal
//   }

//   @override
//   void numberOfEdge() {
//     // TODO: implement numberOfEdge
//   }

//   @override
//   void perimeter() {
//     // TODO: implement perimeter
//   }
// }

// class Circle implements Shape {
//   @override
//   void area() {
//     // TODO: implement area
//   }

//   @override
//   void diagonal() {
//     // TODO: implement diagonal
//   }

//   @override
//   void numberOfEdge() {
//     //Dont have Edges no need of funtion here
//   }

//   @override
//   void perimeter() {
//     // TODO: implement perimeter
//   }
// }

//After Interface Segregation Principle

abstract class Area {
  void area();
}

abstract class Perimeter {
  void perimeter();
}

abstract class Diagonal {
  void diagonal();
}

abstract class NumberOfEdges {
  void numberOfEdge();
}

class Sqaure implements Area, Perimeter, Diagonal, NumberOfEdges {
  @override
  void area() {
    // TODO: implement area
  }

  @override
  void diagonal() {
    // TODO: implement diagonal
  }

  @override
  void numberOfEdge() {
    // TODO: implement numberOfEdge
  }

  @override
  void perimeter() {
    // TODO: implement perimeter
  }
}

class Circle implements Area, Perimeter {
  @override
  void area() {
    // TODO: implement area
  }

  @override
  void perimeter() {
    // TODO: implement perimeter
  }
}
