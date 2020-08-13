class PokemonsModel {
  String name;

  PokemonsModel({this.name});

  PokemonsModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
  }
}
