import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './themes/theme_data.dart';
import 'widgets/drawer.dart';
import 'widgets/category.dart';
import 'screens/pokemons/pokemons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokedex',
      theme: Themes.light,
      home: Pokedex(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  Future<bool> theme() async {
    Themes.assertTheme();
    await Future.delayed(Duration(milliseconds: 2500), () {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.theme(),
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Splash();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return Scaffold(
                drawer: DrawerContent(),
                appBar: AppBar(
                  title: Text('Home'),
                  backgroundColor: Theme.of(context).accentColor,
                ),
                body: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Categorias',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Escolha uma categoria de conteúdo do game',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 400,
                      padding: EdgeInsets.all(30),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          Categories(
                              color: Color(0xffcf305a),
                              imageUrl: 'https://pngimg.com/uploads/pokemon/pokemon_PNG154.png',
                              categoryTitle: 'Pokémons',
                              navigateTo: () {
                                Get.to(Pokemons());
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              break;
            case ConnectionState.none:
              break;
          }
          return Container();
        });
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/pokeball.png',
          height: 300,
        ),
      ),
    );
  }
}
