import "package:flutter/material.dart";

import "../main.dart";

//The navigation bar on the navigation screen

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        height: screenHeight / 10,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.json["totalPages"],
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(screenWidth / 100),
              decoration:
                  BoxDecoration(
                    border: Border.all(
                      width: 2, color: const Color.fromARGB(26, 0, 0, 0))),
              child: TextButton(
                  onPressed: () {
                    data.loading = true;
                    data.page = index + 1;
                    data.fetchData();
                  },
                  child: Text("${index + 1}",
                      style: TextStyle(
                          fontSize: screenWidth / 15,
                          color: data.json["nextPage"] ==
                                  "https://api.disneyapi.dev/characters?page=${index + 2}"
                              ? Colors.black
                              : Colors.blue))),
            );
          },
        ));
  }
}
