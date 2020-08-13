class Type {
  String name;

  Type({this.name});

  Type.fromJson(Map<String, dynamic> json) {
    this.name = json['type']['name'];
  }
}
