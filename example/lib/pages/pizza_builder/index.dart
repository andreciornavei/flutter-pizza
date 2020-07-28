import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza/index.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';
import 'package:flutter_pizza_example/pages/pizza_builder/controller.dart';
import 'package:flutter_pizza_example/pages/pizza_builder/widgets/list.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar_action.dart';
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
                "assets/images/app/logo.png",
                height: 42,
              )
            ],
            actions: <Widget>[
              Obx(
                () => CustomAppBarAction(
                  () => Get.toNamed("/cart"),
                  Feather.shopping_bag,
                  quantity: controller.appController.cart.length ?? 0,
                ),
              ),
            ],
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
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 15,
                            color: AppColors.DARK.withOpacity(0.4),
                            offset: Offset(0, 0),
                          ),
                        ],
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
                        "assets/images/app/tray.png",
                        trayBorder: 15,
                        quantityFlavors: int.parse(Get.parameters["flavors"]),
                        onFlavorDropped: (int position, PizzaData flavor){
                          controller.item.value.flavors[position] = flavor;
                        },
                      ),
                      SizedBox(height: 25),
                      Obx(() => ListPizzas(controller.pizzas.value)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Obx(
            () => Total(
              controller.item.value.subtotal ?? 0,
              controller.item.value.ready ?? false,
            ),
          ),
        );
      },
    );
  }
}
