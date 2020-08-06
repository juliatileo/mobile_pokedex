import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './themes/theme_data.dart';

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
                drawer: Drawer(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        onTap: Themes.setTheme,
                        title: Text('Preferences'),
                        subtitle: Text('Change Theme'),
                        trailing: Icon(Icons.brightness_3),
                      )
                    ],
                  ),
                ),
                appBar: AppBar(
                  title: Text('Home'),
                  backgroundColor: Theme.of(context).accentColor,
                ),
                body: Container(),
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
