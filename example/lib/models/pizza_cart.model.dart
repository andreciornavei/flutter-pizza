import 'package:flutter_pizza_example/models/pizza.model.dart';
import 'package:get/state_manager.dart';

class PizzaCart {
  RxInt nFlavors = RxInt(1);
  RxList<PizzaModel> flavors = RxList<PizzaModel>([]);
  RxInt quantity = RxInt(1);

  PizzaCart(int nFlavors) {
    this.nFlavors.value = nFlavors;
  }

  double get subtotal =>
      flavors.value
          .map((PizzaModel flavor) => flavor.price)
          .reduce((a, b) => a + b) /
      flavors.length;
}
