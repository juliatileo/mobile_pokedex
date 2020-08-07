import './ability.dart';
import './move.dart';
import './sprites.dart';

class SpecificPokemonModel {
  List<Ability> abilities;
  List<Move> moves;
  int height;
  int id;
  String name;
  Sprites sprites;

  SpecificPokemonModel({this.abilities, this.moves, this.height, this.id, this.name, this.sprites});

  SpecificPokemonModel.fromJson(Map<String, dynamic> json) {
    List<Ability> ability = [];
    for (var a in json['abilities']) {
      Ability ab = Ability.fromJson(a);
      ability.add(ab);
    }
    this.abilities = ability;
    List<Move> move = [];
    for (var m in json['moves']) {
      Move mo = Move.fromJson(m);
      move.add(mo);
    }
    this.moves = move;
    this.height = json['height'];
    this.id = json['id'];
    this.name = json['name'];
    this.sprites = Sprites.fromJson(json['sprites']);
  }
}
