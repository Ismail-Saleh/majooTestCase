import 'package:starwarsapp/model/homeTown.dart';
import 'package:starwarsapp/model/people_model.dart';
import 'package:starwarsapp/model/ship_model.dart';

class HomeModel {
  People? people;
  List<Ship>? ship;
  HomeTown? home;

  HomeModel({this.home, this.people, this.ship});
}
