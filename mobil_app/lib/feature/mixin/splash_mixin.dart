import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/login_view.dart';
import 'package:mobil_app/feature/view/splash_view.dart';

mixin SplashMixin on State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }
}
