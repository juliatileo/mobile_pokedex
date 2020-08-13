import './ability.dart';
import './move.dart';
import './sprites.dart';
import './stat.dart';
import './type.dart';

class SpecificPokemonModel {
  List<Ability> abilities;
  List<Move> moves;
  int id;
  String name;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;

  SpecificPokemonModel({this.abilities, this.moves, this.id, this.name, this.sprites});

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
    this.id = json['id'];
    this.name = json['name'];
    this.sprites = Sprites.fromJson(json['sprites']);
    List<Stat> stats = [];
    for (var s in json['stats']) {
      Stat st = Stat.fromJson(s);
      stats.add(st);
    }
    this.stats = stats;
    List<Type> types = [];
    for (var t in json['types']) {
      Type ty = Type.fromJson(t);
      types.add(ty);
    }
    this.types = types;
  }
}
