import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/specific_poke_controller.dart';

class PokemonMoves extends StatelessWidget {
  final int pokeId;
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  PokemonMoves({this.pokeId});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecificPokeController>(
      init: Get.put(SpecificPokeController()),
      builder: (ctx) {
        return ctx.specificPokemon.value != null
            ? ListView.builder(
                itemCount: ctx.specificPokemon.value.moves.length,
                itemBuilder: (_, index) {
                  var move = ctx.specificPokemon.value.moves[index];
                  return ListTile(
                    onTap: () {},
                    title: Text(this.capitalize(move.name)),
                    trailing: Text(move.levelLearned == 0
                        ? 'Aprendido com ${move.learnMethod}'
                        : 'Aprendido no lv ${move.levelLearned.toString()}'),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xffee1515),
                ),
              );
      },
    );
  }
}
