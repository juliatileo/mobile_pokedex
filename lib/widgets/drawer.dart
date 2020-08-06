import 'package:flutter/material.dart';
import '../themes/theme_data.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
