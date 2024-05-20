// ignore_for_file: public_member_api_docs, sort_constructors_first
/* 
      Liskov Substitution Principle

      - an object of a super class should able to replace with
       object of subclass without affecting the correctness of 
       the program

      - in simple if you have a class B that is a sub class of A,
        then you should be able to an instance of B when ever you 
        use an instance of A without causing an unexpexted behaviour 
        or an error


*/

// void main() {}

// Before  Liskov Substitution Principle

// class Rectangle {
//   int width = 0;
//   int height = 0;
//   void setHeight(int h) {
//     height = h;
//   }

//   void setWidth(int w) {
//     width = w;
//   }

//   int calculateArea() {
//     return width * height;
//   }
// }

// class Sqaure extends Rectangle {
//   @override
//   void setWidth(int w) {
//     height = w;
//     width = w;
//   }

//   @override
//   void setHeight(int h) {
//     height = h;
//     width = h;
//   }
// }

// after Liskov Substitution Principle
void main() {
  void printArea(Shape shape) {
    print("Area of the shape is ${shape.area()}");
  }

  Rectangle rectangle = Rectangle(width: 10, height: 20);
  printArea(rectangle);

  Sqaure square = Sqaure(side: 10);
  printArea(square);
}

abstract class Shape {
  int area();
}

class Rectangle implements Shape {
  int width;
  int height;
  Rectangle({
    required this.width,
    required this.height,
  });
  @override
  int area() {
    return width * height;
  }
}

class Sqaure implements Shape {
  int side;
  Sqaure({
    required this.side,
  });
  @override
  int area() {
    return side * side;
  }
}
