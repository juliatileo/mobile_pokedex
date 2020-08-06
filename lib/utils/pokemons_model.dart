class PokemonsModel {
  final String name;

  PokemonsModel({this.name});

  factory PokemonsModel.fromJson(Map<String, dynamic> json) {
    return PokemonsModel(name: json['name']);
  }
}
