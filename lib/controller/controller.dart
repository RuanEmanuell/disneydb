import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import "package:http/http.dart" as http;

part "controller.g.dart";

//MobX controller, it contains the loading controller, the data for the json,
//the page we are going when we click on the navigation bar and the change page
//function

class Controller = _Controller with _$Controller;

abstract class _Controller with Store {
  @observable
  bool loading = true;

  @observable
  var json;

  @observable
  var page = 1;

  @action
  Future<void> fetchData() async {
    var response = await http.get(Uri.parse("https://api.disneyapi.dev/characters?page=$page"));

    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      loading = false;
    } 
  }
}
