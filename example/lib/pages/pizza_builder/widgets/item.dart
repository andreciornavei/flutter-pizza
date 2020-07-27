import 'package:flutter/material.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';
import 'package:flutter_pizza_example/models/pizza.model.dart';
import 'package:flutter_pizza_example/utils/colors.dart';

class ItemPizza extends StatelessWidget {
  final PizzaModel pizza;
  ItemPizza(this.pizza);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -30,
            child: Column(
              children: <Widget>[
                Draggable<PizzaData>(
                  data: this.pizza,
                  feedback: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage(this.pizza.getImagePath()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage(this.pizza.getImagePath()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
