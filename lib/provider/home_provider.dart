import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starwarsapp/model/homeTown.dart';
import 'package:starwarsapp/model/home_model.dart';
import 'package:starwarsapp/model/people_model.dart';
import 'package:starwarsapp/model/ship_model.dart';

class HomeProvider with ChangeNotifier {
  late bool isFilter = false;
  late double widthRasio = 30;
  late double heighRasio = 9;
  int countGrid = 1;
  late People listPeople;
  HomeModel? home;

  Future<void> filterBy() async {
    if (isFilter != true) {
      isFilter = true;
      countGrid = 2;
      widthRasio = 35;
      heighRasio = 32;
    } else {
      isFilter = false;
      countGrid = 1;
      widthRasio = 30;
      heighRasio = 9;
    }
    print(isFilter.toString());
    notifyListeners();
  }

  Future<void> getData() async {
    List<Ship> ship = [];
    HomeTown? hometown;
    try {
      var res =
          await http.get(Uri.parse("https://swapi.dev/api/people/"), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      listPeople = People.fromJson(json.decode(res.body));
      // for (var item in listPeople.results) {
      //   await getShip(item.starships).then((value) async {
      //     ship = value;
      //   });
      //   await getHomeTown(item.homeworld).then((value) async {
      //     hometown = value;
      //   });
      // }
      // print(hometown);
      // home = HomeModel(home: hometown, people: listPeople, ship: ship);
      // print(home?.people?.results[1].name);
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<List<Ship>> getShip(List<String> url) async {
    List<Ship> ship = [];
    for (var item in url) {
      var res = await http.get(Uri.parse(item), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      ship.add(Ship.fromJson(json.decode(res.body)));
    }
    // print(json.encode(ship));
    return ship;
  }

  Future<HomeTown> getHomeTown(String? url) async {
    HomeTown? homeTown;

    var res = await http.get(Uri.parse(url!), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    homeTown = HomeTown.fromJson(json.decode(res.body));

    return homeTown;
  }
}
