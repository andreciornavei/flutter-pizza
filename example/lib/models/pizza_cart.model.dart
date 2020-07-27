import 'package:flutter_pizza_example/models/pizza.model.dart';
import 'package:get/state_manager.dart';

class PizzaCart {
  RxList<PizzaModel> flavors = RxList<PizzaModel>([]);
  RxInt quantity = RxInt(1);

  PizzaCart(int nFlavors) {
    this.flavors.value = List.filled(nFlavors, null);
  }

  double get subtotal =>
      flavors.value
          .map((PizzaModel flavor) => flavor == null ? 0 : flavor.price)
          .reduce((a, b) => a + b) /
      flavors.length;

  bool get ready => flavors.value.contains(null) == false;

}
