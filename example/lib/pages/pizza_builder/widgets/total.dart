import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza_example/pages/pizza_builder/controller.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:flutter_pizza_example/widgets/planet_button.dart';
import 'package:get/get.dart';

class Total extends StatelessWidget {

  final PizzaBuilderController controller = Get.find();
  final bool ready;
  final double total;

  Total(this.total, this.ready);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: AppColors.RED,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "SUBTOTAL",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.WHITE,
                  ),
                ),
                Text(
                  this.total.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.WHITE,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PlanetButton(
              ready ? controller.add : null,
              "ADD IT",
              Feather.shopping_cart,
            ),
          ),
        ],
      ),
    );
  }
}
