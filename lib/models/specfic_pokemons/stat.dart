class Stat {
  String name;
  int baseStat;

  Stat({this.name, this.baseStat});

  Stat.fromJson(Map<String, dynamic> json) {
    this.name = json['stat']['name'];
    this.baseStat = json['base_stat'];
  }
}
