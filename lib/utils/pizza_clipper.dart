import 'package:flutter/widgets.dart';
import 'package:flutter_pizza/utils/pizza_globals.dart';
import 'package:flutter_pizza/utils/pizza_math.dart';

class PizzaClipper extends CustomClipper<Path> {
  
  final int flavorPosition;
  final int quantityFlavors;
  final double pizzaRay;

  PizzaClipper(
    this.flavorPosition,
    this.quantityFlavors,
    this.pizzaRay,
  );

  @override
  Path getClip(Size size) {
    double startRadian = (this.flavorPosition - 1) * PizzaMath.degreesToRadians(PizzaGlobals.FULL_CIRCLE / quantityFlavors);
    double endRadian = this.flavorPosition * PizzaMath.degreesToRadians(PizzaGlobals.FULL_CIRCLE / quantityFlavors);
    final path = Path();
    path.moveTo(pizzaRay, pizzaRay);
    path.arcTo(
      Rect.fromCircle(center: Offset(pizzaRay, pizzaRay), radius: pizzaRay),
      startRadian,
      endRadian - startRadian,
      false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(PizzaClipper oldClipper) => false;
}
