import "package:flutter/material.dart";

//The big image container we have on the character screen

class ImageContainer extends StatelessWidget {
  var image;

  ImageContainer({required this.image});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Hero(
      tag: image,
      child: Center(
        child: Container(
          height: screenHeight / 2.5,
          width: screenWidth,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: FadeInImage.assetNetwork(
                fit: BoxFit.cover, placeholder: "assets/images/logo.png", image: image),
          ),
        ),
      ),
    );
  }
}
