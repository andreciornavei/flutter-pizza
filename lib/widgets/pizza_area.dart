import 'package:flutter/material.dart';
import 'pizza_flavor.dart';

class PizzaArea extends StatelessWidget {
  final double trayDiameter;
  final double trayBorder;
  final int quantityFlavors;
  PizzaArea(
    this.quantityFlavors,
    this.trayDiameter,
    this.trayBorder,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(this.trayDiameter),
      child: Container(
        width: trayDiameter,
        height: trayDiameter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.trayDiameter),
          border: Border.all(
            color: Colors.green.withOpacity(1),
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(this.trayDiameter),
          child: Container(
            width: trayDiameter,
            height: trayDiameter,
            child: Stack(
              children: List<Widget>.generate(
                this.quantityFlavors,
                (flavorPosition) => PizzaFlavor(
                  this.quantityFlavors,
                  this.trayDiameter,
                  this.trayBorder,
                  flavorPosition,
                ),
              ),
              fit: StackFit.expand,
            ),
          ),
        ),
      ),
    );
  }
}
