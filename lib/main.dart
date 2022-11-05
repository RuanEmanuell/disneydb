import 'package:flutter/material.dart';

import "controller/controller.dart";

import "screens/navigation.dart";

//Defining MobX as the var data
var data = Controller();

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationScreen();
  }
}
