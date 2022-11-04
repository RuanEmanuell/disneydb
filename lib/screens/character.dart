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
        body: Column(children: [
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
                    fit: BoxFit.cover, placeholder: "assets/images/disney.png", image: widget.charImage),
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
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: !big ? Colors.transparent : Colors.blue,
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(Icons.arrow_back, size: 45, color: Colors.white)),
          ),
        )
      ]),
      Container(
        margin: const EdgeInsets.all(10),
        child: Text(widget.charName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue)),
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(73, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Text("Films:"),
                  Container(
                    height: screenHeight / 2.5,
                    padding: const EdgeInsets.all(7.5),
                    child: widget.charFilms.length == 0
                        ? const Text("None")
                        : ListView.builder(
                            itemCount: widget.charFilms.length,
                            itemBuilder: (context, index) {
                              return Text(widget.charFilms[index]);
                            },
                          ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(73, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Text("Videogames:"),
                  Container(
                    height: screenHeight / 2.5,
                    padding: const EdgeInsets.all(7.5),
                    child: widget.charVideoGames.length == 0
                        ? const Text("None")
                        : ListView.builder(
                            itemCount: widget.charFilms.length,
                            itemBuilder: (context, index) {
                              return Text(widget.charVideoGames[index]);
                            },
                          ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ]));
  }
}
