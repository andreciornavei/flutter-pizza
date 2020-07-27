import 'package:flutter/material.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';
import 'pizza_flavor.dart';

class PizzaArea extends StatelessWidget {
  final double trayDiameter;
  final double trayBorder;
  final int quantityFlavors;
  final List<PizzaData> data;
  final Function(int, PizzaData) setDataPosition;
  final Function(int, PizzaData) setTmpDataPosition;
  final Function(int) removeTmpDataPosition;

  PizzaArea(
    this.quantityFlavors,
    this.trayDiameter,
    this.trayBorder,
    this.data,
    this.setDataPosition,
    this.setTmpDataPosition,
    this.removeTmpDataPosition,
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
                  this.data,
                  this.setDataPosition,
                  this.setTmpDataPosition,
                  this.removeTmpDataPosition,
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
