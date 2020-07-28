import 'package:flutter/material.dart';
import 'package:flutter_pizza_example/routes.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return GetMaterialApp(
      title: 'Pizza Planet',
      theme: ThemeData(
        primarySwatch: AppColors.RED,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      getPages: routes(),
    );
  }
}
