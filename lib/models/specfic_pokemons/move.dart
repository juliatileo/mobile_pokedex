class Move {
  String name;
  int levelLearned;
  String learnMethod;

  Move({this.name, this.levelLearned, this.learnMethod});

  Move.fromJson(Map<String, dynamic> json) {
    this.name = json['move']['name'];
    this.levelLearned = json['version_group_details'][0]['level_learned_at'];
    this.learnMethod = json['version_group_details'][0]['move_learn_method']['name'];
  }
}
