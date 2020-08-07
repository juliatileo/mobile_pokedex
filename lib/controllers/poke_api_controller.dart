import 'package:get/get.dart';
import '../utils/pokemons_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApiController extends GetxController {
  static PokeApiController get to => Get.find();
  Rx<List<PokemonsModel>> pokemons = Rx<List<PokemonsModel>>();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      print(scrollController.offset);
    });
  }

  ScrollController scrollController = ScrollController();

  getPokemons() async {
    List<PokemonsModel> pokemons = this.pokemons.value != null ? this.pokemons.value : [];
    int paginate = this.pokemons.value != null ? this.pokemons.value.length : 0;
    await http.get('https://pokeapi.co/api/v2/pokemon?offset=$paginate&limit=${paginate + 31}').then((res) {
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

getSpecificPokemon(int id) {}
