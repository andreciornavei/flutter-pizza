import 'package:flutter_pizza/utils/pizza_data.dart';
import 'package:get/state_manager.dart';

class PizzaController extends GetxController{
  
  RxList<PizzaData> _data = RxList<PizzaData>([]);
  List<PizzaData> get data => _data.value;
  set data(List<PizzaData> data) => _data.value = data;

  PizzaController(int quantityFlavors){
    data = List.filled(quantityFlavors, null);
  }

  setDataPosition(int position, PizzaData item){
    _data[position] = item;
  }

}