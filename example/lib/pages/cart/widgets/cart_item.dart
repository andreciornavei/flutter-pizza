import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza/index.dart';
import 'package:flutter_pizza_example/models/pizza_cart.model.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'cart_item_button.dart';

class CartItem extends StatelessWidget {
  final CartController cartController = Get.find();

  final int position;
  final PizzaCart cartItem;
  CartItem(this.position, this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PizzaWidget(
          50,
          "assets/images/app/tray.png",
          trayBorder: 3,
          quantityFlavors: cartItem.flavors.value.length,
          initialData: cartItem.flavors.value,
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                this.cartItem.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.DARK,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  Obx(
                    () => Text(
                      "${this.cartItem.quantity.value.toString()}x ",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.DARK,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    this.cartItem.subtotal.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.RED,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 15),
        Row(
          children: <Widget>[
            CartItemButton(Feather.minus, this.cartItem.decrementQuantity),
            SizedBox(width: 10),
            CartItemButton(Feather.plus, this.cartItem.incrementQuantity),
            SizedBox(width: 10),
            CartItemButton(
                Feather.trash, () => cartController.deleteItem(this.position)),
          ],
        )
      ],
    );
  }
}
