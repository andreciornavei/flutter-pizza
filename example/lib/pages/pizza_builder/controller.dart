import 'package:flutter_pizza_example/models/pizza.model.dart';
import 'package:get/state_manager.dart';

class PizzaBuilderController extends GetxController{
  
  RxList<PizzaModel> _pizzas = RxList<PizzaModel>([]);
  get pizzas => _pizzas.value;
  set pizzas(List<PizzaModel> pizzas) => _pizzas.value = pizzas;


  PizzaBuilderController(){
    pizzas = [
      PizzaModel("assets/images/chicken.png"),
      PizzaModel("assets/images/chocolate.png"),
      PizzaModel("assets/images/endive.png"),
      PizzaModel("assets/images/neapolitan.png"),
      PizzaModel("assets/images/pepperoni.png"),
      PizzaModel("assets/images/shrimp.png"),
    ];
  }

}