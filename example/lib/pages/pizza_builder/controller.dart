import 'package:flutter_pizza_example/models/pizza.model.dart';
import 'package:flutter_pizza_example/models/pizza_cart.model.dart';
import 'package:flutter_pizza_example/utils/json.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../controller.dart';

class PizzaBuilderController extends GetxController {
  final AppController appController = Get.find();
  RxList<PizzaModel> pizzas = RxList<PizzaModel>([]);
  Rx<PizzaCart> item = Rx<PizzaCart>(
    PizzaCart(int.parse(Get.parameters["flavors"])),
  );

  PizzaBuilderController() {
    loadFlavors();
  }

  add() {
    appController.cart.add(item.value);
    Get.back();
  }

  loadFlavors() async {
    //Load categories
    List<dynamic> dataPizzas = await loadJson("assets/data/flavors.json");
    pizzas.addAll(
      dataPizzas
          .map<PizzaModel>((pizza) => PizzaModel(
                id: pizza["id"],
                name: pizza["name"],
                price: pizza["price"],
                description: pizza["description"],
                imagePath: pizza["image"],
              ))
          .toList(),
    );
  }
}
