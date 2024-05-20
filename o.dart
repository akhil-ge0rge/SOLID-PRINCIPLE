/* 
        OPEN / CLOSE PRINCIPLE

      - Software Entities like class , module , function etc. 
        should be open for extention but close for modification

      - Behaviour of the module need to change you should able 
        to make that change by adding new code without changing 
        old code


*/

void main() {
  List<Dish> dishes = [
    Dish(type: "spicy", name: "chicken", isVeg: false),
    Dish(type: "spicy", name: "beaf", isVeg: false),
    Dish(type: "vegetable", name: "potato", isVeg: true),
  ];

/*

Without OPEN / CLOSE PRINCIPLE


  DishFilter dishFilter = DishFilter();
  List<Dish> filterData = dishFilter.byType(dishes, "spicy");
  filterData.forEach((value) => print("${value.name} ,${value.type}"));
*/

//With OPEN / CLOSE PRINCIPLE
  DishFilter dishFilter = DishFilter();
  DishTypeSpecification typeSpec = DishTypeSpecification(type: "spicy");
  VegeterialSpecification vegSpec = VegeterialSpecification();
  List<Dish> filterDataType = dishFilter.filter(dishes, typeSpec);
  List<Dish> filterDataVeg = dishFilter.filter(dishes, vegSpec);
  filterDataType.forEach(
      (value) => print("${value.name} ,${value.type} , ${value.isVeg} , "));
  filterDataVeg.forEach(
      (value) => print("${value.name} ,${value.type}, ${value.isVeg} , "));
}

class Dish {
  String type;
  String name;
  bool isVeg;
  Dish({required this.type, required this.name, required this.isVeg});
}
/*
issue==>
        Every Time If You Want To Add New Filter Criteria 
        You Need To Modify DishFilter Class
 */

// class DishFilter {
//   List<Dish> byType(List<Dish> dishes, String type) {
//     return dishes.where((dish) => dish.type == type).toList();
//   }

//   List<Dish> isVeg(List<Dish> dishes, bool isVeg) {
//     return dishes.where((dish) => dish.isVeg == isVeg).toList();
//   }
// }

//Solution ==>
abstract class Specification<T> {
  bool isSatisfied(T item);
}

abstract class Filter<T> {
  List<T> filter(List<T> items, Specification<T> spec);
}

class DishTypeSpecification implements Specification<Dish> {
  String type;
  DishTypeSpecification({
    required this.type,
  });

  @override
  bool isSatisfied(Dish item) {
    return item.type == type;
  }
}

class VegeterialSpecification implements Specification<Dish> {
  @override
  bool isSatisfied(Dish item) {
    return item.isVeg;
  }
}

class DishFilter implements Filter<Dish> {
  @override
  List<Dish> filter(List<Dish> items, Specification<Dish> spec) {
    return items.where((dish) => spec.isSatisfied(dish)).toList();
  }
}



//eg 2


/*


void main() {
  
  double amount =100.0;
  Discount birthdayDiscount = ChritmassDiscount();
  DiscountCalculator discountCalculator = DiscountCalculator();
  double val = discountCalculator.applyDiscount(amount: amount,discount: birthdayDiscount);
  print("bef disc $amount");
  print("aftr disc $val");
    
  
}

abstract class Discount {
  double calculateDiscount(double amount);
}

class BirthdayDiscount implements Discount {
  @override
  double calculateDiscount(double amount) {
    return amount -(0.1 * amount); //10% Discount On Birthday
  }
}

class ChritmassDiscount implements Discount {
  @override
  double calculateDiscount(double amount) {
    return amount - (0.2 * amount); //20% Discount On Birthday
  }
}

class DiscountCalculator {
  
  double applyDiscount({required Discount discount,required double amount}){
    return discount.calculateDiscount(amount);
  }
}


*/