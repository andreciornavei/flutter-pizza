// import 'package:flutter/material.dart';
// import 'package:flutter_pizza/utils/pizza_data.dart';
// import 'package:get/state_manager.dart';

// class PizzaController<T extends PizzaData> extends GetxController{
  
//   RxList<PizzaData> _data = RxList<PizzaData>([]);
//   List<PizzaData> get data => _data.value;
//   set data(List<PizzaData> data) => _data.value = data;

//   RxList<PizzaData> _tmpData = RxList<PizzaData>([]);
//   List<PizzaData> get tmpData => _data.value;
//   set tmpData(List<PizzaData> tmpData) => _tmpData.value = tmpData;


//   Function(int position, T flavor) onFlavorDropped;
//   List<TabBar> initialData;

//   PizzaController({
//     int quantityFlavors = 1,
//     Function(int position, T flavor) onFlavorDropped,
//     List<T> initialData,
//   }){
//     this.onFlavorDropped = onFlavorDropped;
//     data = List.generate(quantityFlavors, (_) => null);
//     tmpData = List.generate(quantityFlavors, (_) => null);
//     if(initialData != null){
//       for(int i = 0; i <= initialData.length; i++){
//         if(i >= quantityFlavors) break;
//         data[i] = initialData[i];
//       }
//     }
//   }

//   setDataPosition(int position, PizzaData item){
//     _data[position] = item;
//     if(onFlavorDropped != null){
//       onFlavorDropped(position, item);
//     }
//   }

//   setTmpDataPosition(int position, PizzaData item){
//     _tmpData[position] = _data[position];
//     _data[position] = item;
//   }

//   removeTmpDataPosition(int position){
//     _data[position] = _tmpData[position];
//     _tmpData[position] = null;
//   }

  

// }