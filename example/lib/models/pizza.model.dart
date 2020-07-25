import 'package:flutter_pizza/utils/pizza_data.dart';

class PizzaModel implements PizzaData{
  
  final String imagePath;

  PizzaModel(this.imagePath);

  @override
  getImagePath() => this.imagePath;

}