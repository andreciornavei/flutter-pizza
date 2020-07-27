import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza_example/pages/home/controller.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar_action.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            leadings: <Widget>[
              Image.asset(
                "assets/logo.png",
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
            child: RawMaterialButton(
              onPressed: () => Get.toNamed("/pizza_builder/4"),
              child: Text("Pizza de 4 pedaçoes"),
            ),
          ),
        );
      },
    );
  }
}
