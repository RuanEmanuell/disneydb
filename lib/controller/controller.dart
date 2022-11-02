import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import "package:http/http.dart" as http;

part "controller.g.dart";

class Controller = _Controller with _$Controller;

abstract class _Controller with Store {
  @observable
  bool loading = true;

  @observable
  var json;

  @action
  Future<void> fetchData() async {
    var response = await http.get(Uri.parse("https://api.disneyapi.dev/characters"));

    if (response.statusCode == 200) {
      print(response.body);
      json = jsonDecode(response.body);
      loading = false;
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}
