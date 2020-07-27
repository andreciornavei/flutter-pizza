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
      width: 130,
      height: 200,
      margin: EdgeInsets.only(top: 30, bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 15,
            color: AppColors.DARK.withOpacity(0.1),
            offset: Offset(6, 10),
          ),
        ],
      ),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
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
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.pizza.name,
                  style: TextStyle(
                    color: AppColors.RED,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  this.pizza.description,
                  style: TextStyle(
                    color: AppColors.DARK,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
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
