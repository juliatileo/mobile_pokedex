import 'package:flutter/material.dart';
import '../../models/pokemons_model.dart';
import './pokemon_stats.dart';
import '../../controllers/specific_poke_controller.dart';
import 'package:get/get.dart';
import './pokemon_moves.dart';

class PokemonInfo extends StatelessWidget {
  final PokemonsModel pokeInfo;
  final int pokeId;
  PokemonInfo({this.pokeInfo, this.pokeId});
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = <Widget>[
      PokemonStats(pokeId: this.pokeId),
      PokemonMoves(
        pokeId: this.pokeId,
      )
    ];
    return GetBuilder<SpecificPokeController>(
      init: Get.put(SpecificPokeController()),
      initState: (_) => SpecificPokeController.to.getSpecificPokemon(this.pokeId),
      builder: (ctx) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Color(0xffee1515),
              currentIndex: ctx.currentScreen.value,
              onTap: (value) => ctx.updateScreen(value),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.event_note), title: Text('Stats')),
                BottomNavigationBarItem(icon: Icon(Icons.adjust), title: Text('Moves'))
              ],
            ),
            appBar: AppBar(
              title: Text('${this.pokeId}. ${capitalize(this.pokeInfo.name)}'),
              backgroundColor: Theme.of(context).accentColor,
            ),
            body: screens[ctx.currentScreen.value]);
      },
    );
  }
}
