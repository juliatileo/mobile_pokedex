import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/pokemons_model.dart';
import '../../controllers/specific_poke_controller.dart';
import '../../widgets/stat_indicator.dart';

class PokemonInfo extends StatelessWidget {
  final PokemonsModel pokeInfo;
  final int pokeId;
  PokemonInfo({this.pokeInfo, this.pokeId});
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  final PageController pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${this.pokeId}. ${capitalize(this.pokeInfo.name)}'),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: GetBuilder<SpecificPokeController>(
          initState: (_) => SpecificPokeController.to.getSpecificPokemon(this.pokeId),
          builder: (ctx) {
            return ctx.specificPokemon.value != null
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 400,
                        child: PageView(
                          controller: this.pageViewController,
                          allowImplicitScrolling: false,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Image.network(
                              ctx.specificPokemon.value.sprites.frontDefault,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              ctx.specificPokemon.value.sprites.backDefault,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              ctx.specificPokemon.value.sprites.frontShiny,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              ctx.specificPokemon.value.sprites.backShiny,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Arraste para os lados para ver todos os sprites',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: ListView.builder(
                              itemCount: ctx.specificPokemon.value.stats.length,
                              itemBuilder: (_, index) {
                                var stat = ctx.specificPokemon.value.stats[index];
                                return StatIndicator(statName: stat.name, baseStat: stat.baseStat.toDouble());
                              }),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xffee1515),
                    ),
                  );
          },
          init: Get.put(SpecificPokeController()),
        ));
  }
}
