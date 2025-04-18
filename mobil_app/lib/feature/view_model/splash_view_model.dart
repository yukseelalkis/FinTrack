import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/login_view.dart';
import 'package:mobil_app/feature/view/splash_view.dart';
import 'package:mobil_app/product/utilitiy/duration/app_duration.dart';

abstract class SplashViewModel extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(AppDuration.splashDuration, () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }
}
