import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pizza_example/utils/colors.dart';

class CartItemButton extends StatelessWidget {
  final IconData icon;
  final Function action;
  CartItemButton(this.icon, this.action);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: FlatButton(
        onPressed: action,
        color: AppColors.WHITE,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Icon(
          icon,
          color: AppColors.RED,
          size: 16,
        ),
      ),
    );
  }
}