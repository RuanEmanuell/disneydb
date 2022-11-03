import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

import "navigation.dart";

class CharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Hero(
          tag: data.json["data"][0]["imageUrl"],
          child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: "assets/images/disney.png",
              image: data.json["data"][0]["imageUrl"]),
        ),
      ),
    );
  }
}
