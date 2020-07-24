import 'package:flutter/material.dart';
import 'package:flutter_pizza/widgets/pizza_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: PizzaWidget(250, "assets/images/tray.png"),
          ),
        ),
      ),
    );
  }
}
