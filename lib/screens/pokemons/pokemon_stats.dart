import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../controllers/specific_poke_controller.dart';
import '../../widgets/stat_indicator.dart';

class PokemonStats extends StatelessWidget {
  final pokeId;
  final PageController pageViewController = PageController(initialPage: 0);
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  Color selectTypeColor(String typeName) {
    Color color;
    switch (typeName) {
      case 'normal':
        color = Color(0xffaaaa99);
        break;
      case 'fire':
        color = Color(0xffff4422);
        break;
      case 'water':
        color = Color(0xff3399ff);
        break;
      case 'electric':
        color = Color(0xffffcc33);
        break;
      case 'grass':
        color = Color(0xff77cc55);
        break;
      case 'ice':
        color = Color(0xff66ccff);
        break;
      case 'fighting':
        color = Color(0xffbb5544);
        break;
      case 'poison':
        color = Color(0xffaa5599);
        break;
      case 'ground':
        color = Color(0xffddbb99);
        break;
      case 'flying':
        color = Color(0xff8899ff);
        break;
      case 'psychic':
        color = Color(0xffff5599);
        break;
      case 'bug':
        color = Color(0xffaabb22);
        break;
      case 'rock':
        color = Color(0xffbbaa66);
        break;
      case 'ghost':
        color = Color(0xff6666bb);
        break;
      case 'dragon':
        color = Color(0xff7766ee);
        break;
      case 'dark':
        color = Color(0xff543b2f);
        break;
      case 'steel':
        color = Color(0xffaaaabb);
        break;
      case 'fairy':
        color = Color(0xffee99ee);
        break;
      default:
        color = Colors.grey;
        break;
    }
    return color;
  }

  PokemonStats({this.pokeId});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecificPokeController>(
      builder: (ctx) {
        double total = 0;
        if (ctx.specificPokemon.value != null) {
          for (var s in ctx.specificPokemon.value.stats) {
            total += s.baseStat;
          }
        }
        return ctx.specificPokemon.value != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 300,
                      child: PageView(
                        controller: this.pageViewController,
                        allowImplicitScrolling: false,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Image.network(ctx.specificPokemon.value.sprites.frontDefault, fit: BoxFit.contain),
                          Image.network(ctx.specificPokemon.value.sprites.backDefault, fit: BoxFit.contain),
                          Image.network(ctx.specificPokemon.value.sprites.frontShiny, fit: BoxFit.contain),
                          Image.network(ctx.specificPokemon.value.sprites.backShiny, fit: BoxFit.contain)
                        ],
                      ),
                    ),
                    Text(
                      'Arraste para os lados para ver todos os sprites',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: ctx.specificPokemon.value != null
                            ? ctx.specificPokemon.value.types
                                .map((e) => Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                                    decoration: BoxDecoration(
                                      color: this.selectTypeColor(e.name),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    margin: EdgeInsets.only(left: 15, right: 15),
                                    child: Text(
                                      this.capitalize(e.name),
                                      style: TextStyle(color: Colors.white),
                                    )))
                                .toList()
                            : [],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        'Total: ${total.toStringAsFixed(0)}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        height: 370,
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowGlow();
                            return false;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: ctx.specificPokemon.value.stats.length,
                                itemBuilder: (_, index) {
                                  var stat = ctx.specificPokemon.value.stats[index];
                                  return Column(
                                    children: [
                                      StatIndicator(statName: stat.name, baseStat: stat.baseStat.toDouble()),
                                    ],
                                  );
                                }),
                          ),
                        )),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xffee1515),
                ),
              );
      },
      init: Get.put(SpecificPokeController()),
    );
  }
}
