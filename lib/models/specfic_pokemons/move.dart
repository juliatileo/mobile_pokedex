class Move {
  String name;
  int levelLearned;

  Move({this.name, this.levelLearned});

  Move.fromJson(Map<String, dynamic> json) {
    this.name = json['move']['name'];
    this.levelLearned = json['move']['level_learned_at'];
  }
}
