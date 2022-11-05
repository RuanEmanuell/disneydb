import "package:flutter/material.dart";

class CharWidget extends StatelessWidget {
  var onTap;
  var heroImage;
  var name;

  CharWidget({required this.onTap, required this.heroImage, required this.name});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth / 2,
        height: screenHeight / 3,
        margin: EdgeInsets.all(screenWidth / 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue, width: 4),
        ),
        child: Stack(
          children: [
            SizedBox(
                width: screenWidth / 2,
                height: screenHeight / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: heroImage,
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover, placeholder: "assets/images/logo.png", image: heroImage),
                  ),
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(screenWidth / 50),
                  margin: EdgeInsets.all(screenWidth / 100),
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                  child: Text(name, style: TextStyle(fontSize: screenWidth / 25, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
