import 'package:flutter/material.dart';

class LigthTheme {
  late ThemeData theme;
  LigthTheme() {
    theme = ThemeData(
        scaffoldBackgroundColor: Colors.amber,
        appBarTheme: const AppBarTheme(centerTitle: true));
  }
}
