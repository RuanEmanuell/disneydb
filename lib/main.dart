import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import "controller/controller.dart";

var data = Controller();

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Color.fromARGB(255, 34, 95, 145)])),
      child: Observer(
        builder: (_) {
          return data.loading
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: data.json["data"].length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap:(){

                      },
                      child: Container(
                              width: screenWidth / 2,
                              height: screenHeight / 3,
                        margin: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                        color:Colors.black,                                      
                                  borderRadius: BorderRadius.circular(20),
                                                    ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(data.json["data"][index]["imageUrl"]))),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 10,
                              child: Center(
                                child: Text(data.json["data"][index]["name"],
                                    style: TextStyle(color: Colors.white)),
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
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 5, 68, 119),
      items:[
        BottomNavigationBarItem(
          icon:Icon(Icons.arrow_back, color:Colors.white),
          label:"Item",
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.arrow_forward),
          label:"Item"
        ),

      ]
    ),);
  }
}
