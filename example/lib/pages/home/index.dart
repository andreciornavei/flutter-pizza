import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza_example/pages/home/controller.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar.dart';
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
