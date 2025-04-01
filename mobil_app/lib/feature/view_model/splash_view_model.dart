import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/login_view.dart';
import 'package:mobil_app/feature/view/splash_view.dart';
import 'package:mobil_app/product/utilitiy/duration/app_duration.dart';

abstract class SplashViewModel extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToLogin(context);
  }

  void navigateToLogin(BuildContext context) {
    Future.delayed(AppDuration.splashDuration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }
}
