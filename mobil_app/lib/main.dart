import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/splash_view.dart';
import 'package:mobil_app/product/ligth_theme.dart';

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
          scaffoldBackgroundColor: Color.fromRGBO(41, 114, 182, 1),
          appBarTheme: AppBarTheme(centerTitle: true)),
      home: const SplashView(),
    );
  }
}
