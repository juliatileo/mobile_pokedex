import 'package:flutter/material.dart';
import '../../controllers/poke_api_controller.dart';
import 'package:get/get.dart';
import './pokemon_info.dart';

class Pokemons extends StatelessWidget {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemons'),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: GetBuilder<PokeApiController>(
          initState: (_) {
            PokeApiController.to.getPokemons();
          },
          builder: (ctx) {
            return ctx.pokemons.value != null
                ? Container(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scroll) {
                        if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) ctx.getPokemons();
                        return true;
                      },
                      child: ListView.builder(
                        itemCount: ctx.pokemons.value.length,
                        itemBuilder: (_, index) {
                          var pokemon = ctx.pokemons.value[index];
                          return ListTile(
                            title: Text('${index + 1}. ${this.capitalize(pokemon.name)}'),
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => PokemonInfo(
                                      pokeInfo: pokemon,
                                      pokeId: index + 1,
                                    ))),
                          );
                        },
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xffee1515),
                    ),
                  );
          },
          init: Get.put(PokeApiController()),
        ));
  }
}
