import 'package:fooddelivery/models/food_menu.dart';

class Order {
  final FoodMenu food;
  final DateTime date;
  final int quantity;

  Order({
    this.date,
    this.food,
    this.quantity,
  });

}