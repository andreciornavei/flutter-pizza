import 'package:flutter/material.dart';
import 'package:flutter_pizza_example/utils/colors.dart';

class PlanetButton extends StatelessWidget {
  final Function action;
  final String label;
  final IconData icon;
  PlanetButton(this.action, this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: action,
      color: AppColors.WHITE,
      disabledColor: AppColors.DARK.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              this.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: action == null ? AppColors.WHITE.withOpacity(0.3) : AppColors.DARK,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: action == null ? AppColors.RED.withOpacity(0.3) : AppColors.RED,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              this.icon,
              color: action == null ? AppColors.WHITE.withOpacity(0.3) : AppColors.WHITE,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
