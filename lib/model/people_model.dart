import 'package:starwarsapp/model/ship_model.dart';

class People {
  late int count;
  late String next;
  late List<Results> results;

  People({required this.count, required this.next, required this.results});

  People.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    if (json['results'] != null) {
      // ignore: deprecated_member_use
      results = List<Results>.empty(growable: true);
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? height;
  String? mass;
  String? hairColor;
  String? skinColor;
  String? eyeColor;
  String? birthYear;
  String? gender;
  String? homeworld;
  late List<String> films;
  late List<String> species;
  late List<String> vehicles;
  late List<String> starships;
  String? created;
  String? edited;
  String? url;

  Results(
      {this.name,
      this.height,
      this.mass,
      this.hairColor,
      this.skinColor,
      this.eyeColor,
      this.birthYear,
      this.gender,
      this.homeworld,
      required this.films,
      required this.species,
      required this.vehicles,
      required this.starships,
      this.created,
      this.edited,
      this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
    films = List.of(json['films'].cast<String>());
    species = List.of(json['species'].cast<String>());
    vehicles = List.of(json['vehicles'].cast<String>());
    starships = List.of(json['starships'].cast<String>());
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['height'] = this.height;
    data['mass'] = this.mass;
    data['hair_color'] = this.hairColor;
    data['skin_color'] = this.skinColor;
    data['eye_color'] = this.eyeColor;
    data['birth_year'] = this.birthYear;
    data['gender'] = this.gender;
    data['homeworld'] = this.homeworld;
    data['films'] = this.films;
    data['species'] = this.species;
    data['vehicles'] = this.vehicles;
    data['starships'] = this.starships;
    data['created'] = this.created;
    data['edited'] = this.edited;
    data['url'] = this.url;
    return data;
  }
}
