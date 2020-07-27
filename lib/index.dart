import 'package:flutter/material.dart';

import 'utils/pizza_data.dart';
import 'widgets/pizza_area.dart';

class PizzaWidget extends StatefulWidget {
  final int quantityFlavors;
  final String trayAsset;
  final double trayDiameter;
  final double trayBorder;
  final Function(int index, PizzaData data) onFlavorDropped;
  final List<PizzaData> initialData;

  PizzaWidget(
    this.trayDiameter,
    this.trayAsset, {
    this.quantityFlavors = 1,
    this.trayBorder = 15,
    this.onFlavorDropped,
    this.initialData,
  });

  @override
  State<StatefulWidget> createState() => _PizzaWidget();
}

class _PizzaWidget extends State<PizzaWidget> {
  List<PizzaData> data = [];
  List<PizzaData> tmpData = [];

  @override
  initState() {
    super.initState();
    data = List.generate(this.widget.quantityFlavors, (_) => null);
    tmpData = List.generate(this.widget.quantityFlavors, (_) => null);
    if (this.widget.initialData != null) {
      for (int i = 0; i < this.widget.initialData.length; i++) {
        if (i < this.widget.quantityFlavors) {
          data[i] = this.widget.initialData[i];
        } else {
          break;
        }
      }
    }
  }

  setDataPosition(int position, PizzaData item) {
    data[position] = item;
    if (this.widget.onFlavorDropped != null) {
      this.widget.onFlavorDropped(position, item);
    }
  }

  setTmpDataPosition(int position, PizzaData item) {
    tmpData[position] = data[position];
    data[position] = item;
  }

  removeTmpDataPosition(int position) {
    data[position] = tmpData[position];
    tmpData[position] = null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(this.widget.trayDiameter),
      child: Container(
        width: this.widget.trayDiameter,
        height: this.widget.trayDiameter,
        padding: EdgeInsets.all(this.widget.trayBorder),
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(this.widget.trayAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: PizzaArea(
          this.widget.quantityFlavors,
          this.widget.trayDiameter,
          this.widget.trayBorder,
          this.data,
          this.setDataPosition,
          this.setTmpDataPosition,
          this.removeTmpDataPosition,
        ),
      ),
    );
  }
}
