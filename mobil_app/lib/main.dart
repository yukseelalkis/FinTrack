import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/fee_view.dart';
import 'package:mobil_app/feature/view/finanche_view.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/feature/view/splash_view.dart';
import 'package:mobil_app/product/theme/ligth_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LightTheme _lightTheme = LightTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _lightTheme.theme,
        home: const FinancheView());
  }
}
