import 'package:flutter/material.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';
import 'package:flutter_pizza_example/models/pizza.model.dart';

class ItemPizza extends StatelessWidget {
  final PizzaModel pizza;
  ItemPizza(this.pizza);

  @override
  Widget build(BuildContext context) {
    return Draggable<PizzaData>(
      data: this.pizza,
      feedback: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: AssetImage(this.pizza.getImagePath()),
            fit: BoxFit.cover,
          ),
        ),
      ),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: AssetImage(this.pizza.getImagePath()),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
