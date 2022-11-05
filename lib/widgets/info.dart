import "package:flutter/material.dart";

class InfoWidget extends StatelessWidget {
  var infoTitle;
  var infoList;

  InfoWidget({required this.infoTitle, required this.infoList});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(screenWidth / 50),
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: screenWidth / 50),
              padding: EdgeInsets.all(screenWidth / 100),
              width: screenWidth / 3.25,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text(infoTitle, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
            ),
            Container(
              height: screenHeight / 2.5,
              padding: EdgeInsets.all(screenWidth / 75),
              child: infoList.length == 0
                  ? Container(
                      margin: EdgeInsets.only(top: screenHeight / 30),
                      child: const Text("None",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    )
                  : ListView.builder(
                      itemCount: infoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: screenWidth / 30, right: screenWidth / 30, bottom: screenWidth / 40),
                          child: Text(infoList[index],
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
