class Sprites {
  String backDefault;
  String backShiny;
  String frontDefault;
  String frontShiny;

  Sprites({this.backDefault, this.backShiny, this.frontDefault, this.frontShiny});

  Sprites.fromJson(Map<String, dynamic> json) {
    this.backDefault = json['back_default'];
    this.backShiny = json['back_shiny'];
    this.frontDefault = json['front_default'];
    this.frontShiny = json['front_shiny'];
  }
}
