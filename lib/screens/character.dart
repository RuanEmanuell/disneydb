import "package:flutter/material.dart";

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
  bool big = false;

  @override
  void initState() {
    super.initState();
    print(widget.charVideoGames.toString());
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        big = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(children: [
          Hero(
            tag: widget.charImage,
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
                      fit: BoxFit.cover,
                      placeholder: "assets/images/disney.png",
                      image: widget.charImage),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SafeArea(
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(screenWidth / 100),
                  margin: EdgeInsets.all(screenWidth / 50),
                  decoration: BoxDecoration(
                      color: !big ? Colors.transparent : Colors.blue,
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(Icons.arrow_back, size: screenWidth / 7.5, color: Colors.white)),
            ),
          )
        ]),
        Container(
          margin: EdgeInsets.all(screenWidth / 50),
          child: Text(widget.charName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: screenWidth / 12, color: Colors.blue)),
        ),
        Row(
          children: [
            Expanded(
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
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: const Text("Films:",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    Container(
                      height: screenHeight / 2.5,
                      padding: EdgeInsets.all(screenWidth / 75),
                      child: widget.charFilms.length == 0
                          ? Container(
                              margin: EdgeInsets.only(top: screenHeight / 30),
                              child: const Text("None",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            )
                          : ListView.builder(
                              itemCount: widget.charFilms.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: screenWidth / 30,
                                      right: screenWidth / 30,
                                      bottom: screenWidth / 40),
                                  child: Text(widget.charFilms[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.white)),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
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
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: const Text("Videogames:",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    Container(
                      height: screenHeight / 2.5,
                      padding: EdgeInsets.all(screenWidth / 75),
                      child: widget.charVideoGames.length == 0
                          ? Container(
                              margin: EdgeInsets.only(top: screenHeight / 30),
                              child: const Text("None",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            )
                          : ListView.builder(
                              itemCount: widget.charVideoGames.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: screenWidth / 30,
                                      right: screenWidth / 30,
                                      bottom: screenWidth / 40),
                                  child: Text(widget.charVideoGames[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.white)),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
