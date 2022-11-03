import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import "../controller/controller.dart";
import "character.dart";

var data = Controller();

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
    return Scaffold(body: Container(
      child: Observer(
        builder: (_) {
          return data.loading
              ? const Center(child: CircularProgressIndicator(color: Colors.blue))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: data.json["data"].length,
                  itemBuilder: (context, index) {
                    return InkWell(
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
                      child: Container(
                        width: screenWidth / 2,
                        height: screenHeight / 3,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue, width: 3),
                        ),
                        child: Stack(
                          children: [
                            SizedBox(
                                width: screenWidth / 2,
                                height: screenHeight / 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Hero(
                                    tag: data.json["data"][index]["imageUrl"],
                                    child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        placeholder: "assets/images/disney.png",
                                        image: data.json["data"][index]["imageUrl"]),
                                  ),
                                )),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 10,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                                  child: Text(data.json["data"][index]["name"],
                                      style: const TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    ), bottomNavigationBar: BottomAppBar(child: Observer(builder: (_) {
      return data.loading
          ? Container(height: 0)
          : SizedBox(
              height: screenHeight / 10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.json["totalPages"],
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 13.5, right: 13.5),
                    child: TextButton(
                        onPressed: () {
                          data.loading = true;
                          data.page = index + 1;
                          data.fetchData();
                        },
                        child: Text("${index + 1}", style: const TextStyle(fontSize: 21))),
                  );
                },
              ));
    })));
  }
}
