import 'package:flutter/material.dart';
import 'package:flutter_pizza/widget.dart';
import 'package:flutter_pizza_example/pages/pizza_builder/controller.dart';
import 'package:flutter_pizza_example/pages/pizza_builder/widgets/list.dart';
import 'package:get/state_manager.dart';

class PizzaBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PizzaBuilderController>(
      init: PizzaBuilderController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PizzaWidget(
                    250,
                    "assets/images/tray.png",
                    quantityFlavors: 4,
                    trayBorder: 15,
                  ),
                  SizedBox(height: 25),
                  Obx(() => ListPizzas(controller.pizzas)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
