import 'package:flutter/material.dart';
import 'package:flutter_pizza/utils/pizza_clipper.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';

class PizzaFlavor extends StatelessWidget {
  final double trayBorder;
  final double trayDiameter;
  final int flavorPosition;
  final int quantityFlavors;
  final List<PizzaData> data;
  final Function(int, PizzaData) setDataPosition;
  final Function(int, PizzaData) setTmpDataPosition;
  final Function(int) removeTmpDataPosition;

  PizzaFlavor(
    this.quantityFlavors,
    this.trayDiameter,
    this.trayBorder,
    this.flavorPosition,
    this.data,
    this.setDataPosition,
    this.setTmpDataPosition,
    this.removeTmpDataPosition,
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
            setDataPosition(this.flavorPosition, data);
            return true;
          },
          onWillAccept: (data) {
            setTmpDataPosition(this.flavorPosition, data);
            return true;
          },
          onLeave: (data) {
            removeTmpDataPosition(this.flavorPosition);
            return true;
          },
          builder: (context, candidates, rejects) {
            return data.length >= this.flavorPosition &&
                    data.elementAt(this.flavorPosition) != null
                ? Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          data[this.flavorPosition].getImagePath(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
