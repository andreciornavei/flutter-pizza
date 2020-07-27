import 'package:flutter/widgets.dart';
import 'package:flutter_pizza_example/pages/home/controller.dart';
import 'package:get/route_manager.dart';

import 'pages/home/index.dart';
import 'pages/pizza_builder/index.dart';

routes() => [
  GetPage(name:"/", page: () => Home()),
  GetPage(name:"/pizza_builder/:flavors", page: () => PizzaBuilder(), transition: Transition.downToUp, transitionDuration: Duration(milliseconds: 300)),
];