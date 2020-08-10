import 'package:get/get.dart';
import '../models/pokemons_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApiController extends GetxController {
  static PokeApiController get to => Get.find();
  Rx<List<PokemonsModel>> pokemons = Rx<List<PokemonsModel>>();

  getPokemons() async {
    List<PokemonsModel> pokemons = this.pokemons.value != null ? this.pokemons.value : [];
    await http.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=649').then((res) {
      if (res.statusCode == 200) {
        for (var p in json.decode(res.body)['results']) {
          PokemonsModel pok = PokemonsModel.fromJson(p);
          pokemons.add(pok);
        }
        this.pokemons.value = pokemons;
        update();
      }
    });
  }
}
