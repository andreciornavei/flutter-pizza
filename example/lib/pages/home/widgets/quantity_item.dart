import 'package:flutter/material.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:get/get.dart';

class QuantityItem extends StatelessWidget {
  final quantityFlavors;

  QuantityItem(this.quantityFlavors);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/pizza_builder/$quantityFlavors"),
      child: Container(
        width: 120,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: AppColors.RED,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 15,
              color: AppColors.DARK.withOpacity(0.2),
              offset: Offset(6, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                Text(
                  "$quantityFlavors",
                  style: TextStyle(
                    color: AppColors.WHITE,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "flavor${quantityFlavors > 1 ? "s" : ""}",
                  style: TextStyle(
                    color: AppColors.WHITE,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/app/pizza_outline.png", width: 50),
          ],
        ),
      ),
    );
  }
}
