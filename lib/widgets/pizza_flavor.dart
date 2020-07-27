import 'package:flutter/material.dart';
import 'package:flutter_pizza/controller.dart';
import 'package:flutter_pizza/utils/pizza_clipper.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';
import 'package:flutter_pizza/utils/pizza_globals.dart';
import 'package:get/get.dart';

class PizzaFlavor extends StatelessWidget {
  final PizzaController controller = Get.find();
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
            controller.setDataPosition(this.flavorPosition, data);
            return true;
          },
          onWillAccept: (data) {
            print("Entered ${data.getImagePath()} in $flavorPosition");
            controller.setTmpDataPosition(this.flavorPosition, data);
            return true;
          },
          onLeave: (data) {
            print("Leaved from $flavorPosition");
            controller.removeTmpDataPosition(this.flavorPosition);
            return true;
          },
          builder: (context, candidates, rejects) {
            return controller.data.length >= this.flavorPosition && controller.data.elementAt(this.flavorPosition) != null
                ? Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(controller.data[this.flavorPosition].getImagePath()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    color: PizzaGlobals.colors[this.flavorPosition],
                  );
          },
        ),
      ),
    );
  }
}
