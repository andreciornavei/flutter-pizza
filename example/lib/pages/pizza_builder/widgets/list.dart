import 'package:flutter/material.dart';
import 'package:flutter_pizza_example/models/pizza.model.dart';

import 'item.dart';

class ListPizzas extends StatelessWidget {
  final List<PizzaModel> pizzas;

  ListPizzas(this.pizzas);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 25),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: 25),
        itemCount: this.pizzas.length,
        itemBuilder: (_, index) {
          return ItemPizza(pizzas[index]);
        },
      ),
    );
  }
}
