import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

import 'pages/pizza_builder/index.dart';

routes() => [
  GetPage(name:"/", page: () => PizzaBuilder()),
];