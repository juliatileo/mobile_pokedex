import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/pokemons_model.dart';
import '../../controllers/specific_poke_controller.dart';

class PokemonInfo extends StatelessWidget {
  final PokemonsModel pokeInfo;
  final int pokeId;
  PokemonInfo({this.pokeInfo, this.pokeId});
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(capitalize(this.pokeInfo.name)),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: GetBuilder<SpecificPokeController>(
          initState: (_) => SpecificPokeController.to.getSpecificPokemon(this.pokeId),
          builder: (ctx) {
            return ctx.specificPokemon.value != null
                ? Container(
                    child: Text('sim'),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
          init: Get.put(SpecificPokeController()),
        ));
  }
}
