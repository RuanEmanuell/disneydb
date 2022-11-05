import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import "../main.dart";
import "character.dart";

import "../widgets/navigationbar.dart";
import "../widgets/charbox.dart";


class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreen createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen> {
  @override
  void initState() {
    super.initState();
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(body: Observer(
      builder: (_) {
        return data.loading
            ? const Center(child: CircularProgressIndicator(color: Colors.blue))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: data.json["data"].length,
                itemBuilder: (context, index) {
                  return data.json["data"][index].length == 11
                      ? CharWidget(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return CharacterScreen(
                                  charName: data.json["data"][index]["name"],
                                  charImage: data.json["data"][index]["imageUrl"],
                                  charFilms: data.json["data"][index]["films"] != []
                                      ? data.json["data"][index]["films"]
                                      : "none",
                                  charVideoGames: data.json["data"][index]["videoGames"] != []
                                      ? data.json["data"][index]["videoGames"]
                                      : "none",
                                );
                              },
                            ));
                          },
                          heroImage: data.json["data"][index]["imageUrl"],
                          name: data.json["data"][index]["name"])
                      : Container(
                          width: screenWidth / 2,
                          height: screenHeight / 3,
                          margin: EdgeInsets.all(screenWidth / 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 4),
                              image:
                                  const DecorationImage(image: AssetImage("assets/images/disney.png"))));
                },
              );
      },
    ), bottomNavigationBar: BottomAppBar(child: Observer(builder: (_) {
      return data.loading ? Container(height: 0) : CustomNavigationBar();
    })));
  }
}
