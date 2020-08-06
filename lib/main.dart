import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './themes/theme_data.dart';
import './components/drawer.dart';
import './components/category.dart';

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
                      height: 300,
                      padding: EdgeInsets.all(30),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Categories(
                            color: Color(0xffcf305a),
                            imageUrl:
                                'https://lh3.googleusercontent.com/proxy/qc4Nbw145QDyyiOZZGtjCLadA4xNsa-u2T2qHXr-E8xxyt3FkP6fIfEo8oiifD0OCizw1GcvSUzKUDHwYd8LWerwxpJArWpyUutN7WStQKiVgAZkAASGvx7StFuIezh32w',
                            categoryTitle: 'Pokémons',
                          ),
                          Categories(
                            color: Color(0xff7530cf),
                            imageUrl: 'https://pokemonfaqs.com/wp-content/uploads/2020/04/enigma_berry.png',
                            categoryTitle: 'Berries',
                          ),
                          Categories(
                            color: Color(0xffe37452),
                            imageUrl: 'https://image.flaticon.com/icons/png/512/35/35837.png',
                            categoryTitle: 'Moves',
                          ),
                          Categories(
                            color: Color(0xff3087cf),
                            imageUrl:
                                'https://static.wikia.nocookie.net/international-pokedex/images/9/9a/Macho_Brace.png/revision/latest/scale-to-width-down/340?cb=20190508182400',
                            categoryTitle: 'Itens',
                          )
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
