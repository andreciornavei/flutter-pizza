import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'cart_item.dart';

class CartList extends StatelessWidget {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.all(25),
        itemCount: controller.appController.cart.length,
        separatorBuilder: (context, index) => Divider(height: 25),
        itemBuilder: (context, index) {
          return CartItem(index, controller.appController.cart.elementAt(index));
        },
      ),
    );
  }
}