import "package:flutter/material.dart";

//The return button on the character screen

class ReturnButton extends StatelessWidget {
  var visible;

  ReturnButton({required this.visible});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SafeArea(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(screenWidth / 100),
            margin: EdgeInsets.all(screenWidth / 50),
            decoration: BoxDecoration(
                color: visible ? Colors.blue : Colors.transparent,
                border: Border.all(width: 3, color: Colors.white),
                borderRadius: BorderRadius.circular(50)),
            child: Icon(Icons.arrow_back, size: screenWidth / 7.5, color: Colors.white)),
      ),
    );
  }
}
