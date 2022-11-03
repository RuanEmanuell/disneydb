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
  @override
  void initState() {
    super.initState();
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Color.fromARGB(255, 34, 95, 145)])),
          child: Observer(
            builder: (_) {
              return data.loading
                  ? const Center(child: CircularProgressIndicator(color: Colors.white))
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: data.json["data"].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: screenWidth / 2,
                            height: screenHeight / 3,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
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
                                        style: const TextStyle(color: Colors.white)),
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
        bottomNavigationBar: BottomAppBar(
            child: SizedBox(
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
                ))));
  }
}
