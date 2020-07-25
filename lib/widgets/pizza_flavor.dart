import 'package:flutter/material.dart';
import 'package:flutter_pizza/utils/pizza_clipper.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';
import 'package:flutter_pizza/utils/pizza_globals.dart';

class PizzaFlavor extends StatelessWidget {
  final double trayBorder;
  final double trayDiameter;
  final int flavorPosition;
  final int quantityFlavors;

  PizzaFlavor(
    this.quantityFlavors,
    this.trayDiameter,
    this.trayBorder,
    this.flavorPosition,
  );

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PizzaClipper(
          this.flavorPosition +
              1, // need to increments 1 to not starts with zero for math purposes
          this.quantityFlavors,
          (this.trayDiameter / 2) - this.trayBorder),
      child: GestureDetector(
        onTap: () =>
            print("Touchig the slice of pizza in part $flavorPosition"),
        child: DragTarget<PizzaData>(
          onAccept: (data) {
            print("Dropped ${data.getImagePath()} in $flavorPosition");
            return true;
          },
          onWillAccept: (data) {
            print("Entered ${data.getImagePath()} in $flavorPosition");
            return true;
          },
          onLeave: (data) {
            print("Leaved from $flavorPosition");
            return true;
          },
          builder: (context, candidates, rejects) {
            return Container(
              color: PizzaGlobals.colors[this.flavorPosition],
            );
          },
        ),
      ),
    );
  }
}
