import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/splash_view.dart';
import 'package:mobil_app/product/theme/ligth_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Zorunlu
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LightTheme _lightTheme = LightTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme.theme,
      home: const SplashView(), // Giriş ekranın
    );
  }
}
