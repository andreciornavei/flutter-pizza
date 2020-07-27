import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza/widget.dart';
import 'package:flutter_pizza_example/pages/pizza_builder/controller.dart';
import 'package:flutter_pizza_example/pages/pizza_builder/widgets/list.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'widgets/total.dart';

class PizzaBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PizzaBuilderController>(
      init: PizzaBuilderController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            leadings: <Widget>[
              Image.asset(
                "assets/logo.png",
                height: 42,
              )
            ],
            // actions: <Widget>[
            //   IconButton(
            //     onPressed: null,
            //     icon: Icon(
            //       Feather.shopping_bag,
            //       size: 24,
            //       color: AppColors.RED,
            //     ),
            //   )
            // ],
          ),
          body: Container(
            height: Get.height - 100,
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: Get.width - 320,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.RED,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Feather.arrow_left,
                          color: AppColors.WHITE,
                          size: 21,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      PizzaWidget(
                        Get.width - 150,
                        "assets/images/tray.png",
                        quantityFlavors: 4,
                        trayBorder: 15,
                      ),
                      SizedBox(height: 25),
                      Obx(() => ListPizzas(controller.pizzas.value)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Total(controller.total),
        );
      },
    );
  }
}
