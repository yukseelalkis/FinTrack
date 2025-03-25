import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/product/theme/ligth_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LigthTheme ligthTheme = LigthTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(centerTitle: true)),
        home: const HomeView());
  }
}
