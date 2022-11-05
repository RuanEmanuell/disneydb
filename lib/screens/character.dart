import "package:flutter/material.dart";

import "../widgets/imagecontainer.dart";
import "../widgets/info.dart";
import "../widgets/returnbutton.dart";

class CharacterScreen extends StatefulWidget {
  var charName;
  var charImage;
  var charFilms;
  var charVideoGames;

  CharacterScreen({this.charName, this.charImage, this.charFilms, this.charVideoGames});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {

  //Little transition on the return button
  bool visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
         Stack(
          children: [
            ImageContainer(image: widget.charImage), 
            ReturnButton(visible: visible)]),
        Container(
          margin: EdgeInsets.all(screenWidth / 50),
          child: Text(widget.charName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: screenWidth / 12, color: Colors.blue)),
        ),
        Row(
          children: [
            InfoWidget(infoTitle: "Films", infoList: widget.charFilms),
            InfoWidget(infoTitle: "Videogames", infoList: widget.charVideoGames)
          ],
        ),
      ]),
    ));
  }
}
