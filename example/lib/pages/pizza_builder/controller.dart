import 'package:flutter_pizza_example/models/pizza.model.dart';
import 'package:flutter_pizza_example/utils/json.dart';
import 'package:get/state_manager.dart';

class PizzaBuilderController extends GetxController {
  RxList<PizzaModel> pizzas = RxList<PizzaModel>([]);
  
  PizzaBuilderController() {
    loadFlavors();
  }

  double get total => 0;

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
