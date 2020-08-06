import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes {
  static ThemeData dark = ThemeData(brightness: Brightness.dark, accentColor: Color(0xff333333));
  static ThemeData light = ThemeData(brightness: Brightness.light, accentColor: Color(0xffff4f42));

  static assertTheme() async {
    SharedPreferences sharedTheme = await SharedPreferences.getInstance();
    if (sharedTheme.getString('theme') == 'dark') {
      Get.changeTheme(dark);
    } else {
      Get.changeTheme(light);
    }
  }

  static setTheme() async {
    SharedPreferences sharedTheme = await SharedPreferences.getInstance();
    if (sharedTheme.getString('theme') == 'dark') {
      sharedTheme.setString('theme', 'light');
      Get.changeTheme(light);
    } else if (sharedTheme.getString('theme') == 'light') {
      sharedTheme.setString('theme', 'dark');
      Get.changeTheme(dark);
    }
  }
}
