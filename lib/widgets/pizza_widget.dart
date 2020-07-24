import 'package:flutter/material.dart';

class PizzaWidget extends StatelessWidget {
  final double size;
  final String trayAsset;

  PizzaWidget(this.size, this.trayAsset);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(this.size),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(this.trayAsset),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
