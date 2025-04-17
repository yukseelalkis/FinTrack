import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/feature/view/payment_view.dart';
import 'package:mobil_app/feature/view/splash_view.dart';
import 'package:mobil_app/product/theme/ligth_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Zorunlu
  // Eğer burada token kontrolü vs yapacaksan buraya ekleyebilirsin
  // final prefs = await SharedPreferences.getInstance();

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
      home: const HomeView(), // Giriş ekranın
    );
  }
}
