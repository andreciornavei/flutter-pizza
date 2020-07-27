import 'package:flutter_pizza/controller.dart';
import 'package:flutter_pizza_example/models/pizza.model.dart';
import 'package:flutter_pizza_example/models/pizza_cart.model.dart';
import 'package:flutter_pizza_example/utils/json.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PizzaBuilderController extends GetxController {
  RxList<PizzaModel> pizzas = RxList<PizzaModel>([]);
  Rx<PizzaCart> item = Rx<PizzaCart>(
    PizzaCart(int.parse(Get.parameters["flavors"])),
  );

  PizzaController pizzaController;

  PizzaBuilderController() {
    pizzaController = PizzaController<PizzaModel>(
      quantityFlavors: int.parse(Get.parameters["flavors"]),
      onFlavorDropped: (int position, PizzaModel flavor) {
        item.value.flavors[position] = flavor;
      },
    );
    loadFlavors();
  }

  add(){
    print("ADICIONA AO CARRMINHO");
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
