import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';


class CharacterScreen extends StatelessWidget {
  var charName;
  var charImage;
  var charFilms;
  var charVideoGames;

  CharacterScreen({this.charName, this.charImage, this.charFilms, this.charVideoGames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Hero(
          tag: charImage,
          child: FadeInImage.assetNetwork(
              fit: BoxFit.cover, placeholder: "assets/images/disney.png", image: charImage),
        ),
      ),
    );
  }
}
