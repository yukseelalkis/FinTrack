import 'package:flutter/material.dart';
import 'package:mobil_app/product/extension/app_route_extension.dart';
import 'package:mobil_app/product/utilitiy/enum/app_routes.dart';

class NavigatorHelper {
  const NavigatorHelper._();

  static void navigateToPage(BuildContext context, AppRoute route,
      {dynamic data}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => route.getPage(data: data)),
    );
  }

  static void navigateAndReplace(BuildContext context, AppRoute route,
      {dynamic data}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => route.getPage(data: data)),
    );
  }

  static void navigateAndRemoveUntil(BuildContext context, AppRoute route,
      {dynamic data}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => route.getPage(data: data)),
      (_) => false,
    );
  }
}
