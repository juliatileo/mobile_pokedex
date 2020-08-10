import 'package:get/get.dart';
import 'dart:convert';
import '../models/specfic_pokemons/specific_pokemon_model.dart';
import 'package:http/http.dart' as http;

class SpecificPokeController extends GetxController {
  static SpecificPokeController get to => Get.find();
  Rx<SpecificPokemonModel> specificPokemon = Rx<SpecificPokemonModel>();

  getSpecificPokemon(int id) async {
    this.clearSelectedPoke();
    SpecificPokemonModel specificPokemon;
    await http.get('https://pokeapi.co/api/v2/pokemon/$id').then((res) {
      if (res.statusCode == 200) {
        SpecificPokemonModel pok = SpecificPokemonModel.fromJson(json.decode(res.body));
        specificPokemon = pok;
        this.specificPokemon.value = specificPokemon;
        update();
      }
    });
  }

  clearSelectedPoke() {
    this.specificPokemon.value = null;
    update();
  }
}
