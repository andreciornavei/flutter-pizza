import 'package:flutter_pizza/utils/pizza_data.dart';

class PizzaModel implements PizzaData {
  final int id;
  final String imagePath;
  final String name;
  final double price;
  final String description;

  PizzaModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.imagePath,
  });

  @override
  getImagePath() => this.imagePath;
}
