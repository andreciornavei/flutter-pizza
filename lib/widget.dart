import 'package:flutter/material.dart';
import 'package:flutter_pizza/widgets/pizza_area.dart';
import 'package:get/state_manager.dart';

import 'controller.dart';

class PizzaWidget extends StatelessWidget {
  final int quantityFlavors;
  final String trayAsset;
  final PizzaController controller;
  final double trayDiameter;
  final double trayBorder;

  PizzaWidget(
    this.trayDiameter,
    this.trayAsset, {
    this.controller,
    this.quantityFlavors = 1,
    this.trayBorder = 15,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PizzaController>(
      init: controller == null ? PizzaController(this.quantityFlavors) : controller,
      builder: (controller) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(this.trayDiameter),
          child: Container(
            width: trayDiameter,
            height: trayDiameter,
            padding: EdgeInsets.all(this.trayBorder),
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage(this.trayAsset),
                fit: BoxFit.cover,
              ),
            ),
            child: PizzaArea(
              this.quantityFlavors,
              this.trayDiameter,
              this.trayBorder,
            ),
          ),
        );
      },
    );
  }
}
