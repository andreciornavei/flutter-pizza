import 'package:flutter/material.dart';
import 'package:flutter_pizza/utils/pizza_data.dart';
import 'package:flutter_pizza/widget.dart';

import 'models/pizza.model.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PizzaWidget(
                  250,
                  "assets/images/tray.png",
                  quantityFlavors: 3,
                  trayBorder: 15,
                ),
                SizedBox(height: 25),
                Draggable<PizzaData>(
                  data: PizzaModel("path_da_imagem"),
                  feedback: Container(
                    width: 50,
                    height: 50,
                    color: Colors.purple,
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.purple,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
