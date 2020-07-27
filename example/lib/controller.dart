import 'package:flutter_pizza_example/models/pizza_cart.model.dart';
import 'package:get/state_manager.dart';

class AppController extends GetxController{
  RxList<PizzaCart> cart = RxList<PizzaCart>([]);
}