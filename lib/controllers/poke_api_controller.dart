import 'package:get/get.dart';
import '../utils/pokemons_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApiController extends GetxController {
  static PokeApiController get to => Get.find();
  Rx<List<PokemonsModel>> pokemons = Rx<List<PokemonsModel>>();

  getPokemons() async {
    final http.Response response = await http.get('https://pokeapi.co/api/v2/pokemon');
    List<PokemonsModel> pokemons = [];
    if (response.statusCode == 200) {
      for (var p in json.decode(response.body)) {
        PokemonsModel pok = PokemonsModel.fromJson(p);
        pokemons.add(pok);
      }
      this.pokemons.value = pokemons;
      update();
    }
  }
}
