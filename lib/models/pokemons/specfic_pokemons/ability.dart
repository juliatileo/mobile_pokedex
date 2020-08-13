class Ability {
  String name;

  Ability({this.name});

  Ability.fromJson(Map<String, dynamic> json) {
    this.name = json['ability']['name'];
  }
}
