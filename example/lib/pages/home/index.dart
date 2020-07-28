import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza_example/pages/home/controller.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar.dart';
import 'package:flutter_pizza_example/widgets/custom_appbar_action.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'widgets/campaign.dart';
import 'widgets/quantity_list.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Campaign(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "With a few steps, we can launch your pizza!",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.GREY,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1 - Select the quantity of flavors",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "2 - Build your pizza",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "3 - Place your order",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                QuantityList(8)
              ],
            ),
          ),
        );
      },
    );
  }
}
