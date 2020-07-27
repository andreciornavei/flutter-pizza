import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_pizza_example/utils/colors.dart';
import 'package:flutter_pizza_example/widgets/planet_button.dart';
import 'package:get/get.dart';

import '../controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        border: Border(
          top: BorderSide(
            color: AppColors.LIGHT,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "TOTAL",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.DARK,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.total,
                      style: TextStyle(
                        fontSize: 26,
                        color: AppColors.RED,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: PlanetButton(
                controller.placeOrder,
                "PURCHASE",
                Feather.chevron_right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
