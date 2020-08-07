import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonInfo extends StatelessWidget {
  final List arguments = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(this.arguments[0]),
      backgroundColor: Theme.of(context).accentColor,
    ));
  }
}
