import 'package:flutter/material.dart';
import 'package:flutter_pizza_example/utils/colors.dart';

class Campaign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.DARK,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage("assets/images/app/background_campaign.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "The galaxy pizza",
                style: TextStyle(
                  color: AppColors.WHITE,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Here you can build your own pizza with how many flavors you "
                "desire, and more, you pay only per flavor pieces.",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.WHITE,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Start now!",
                style: TextStyle(
                  color: AppColors.WHITE,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Positioned(
            right: -55,
            bottom: -50,
            child: Image.asset("assets/images/app/pizza_campaign.png", height: 120),
          )
        ],
      ),
    );
  }
}
