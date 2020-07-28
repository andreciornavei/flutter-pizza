import 'package:flutter/material.dart';
import 'quantity_item.dart';

class QuantityList extends StatelessWidget {
  final int repeater;

  QuantityList(this.repeater);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: 25),
        itemCount: repeater,
        itemBuilder: (_, index) => QuantityItem(index + 1),
      ),
    );
  }
}
