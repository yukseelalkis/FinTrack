import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/finanche_view.dart';
import 'package:mobil_app/feature/view/splash_view.dart';
import 'package:mobil_app/feature/view/widget/nav_bar.dart';
import 'package:mobil_app/product/theme/ligth_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LigthTheme ligthTheme = LigthTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(centerTitle: true)),
        home: FinancheView());
  }
}
