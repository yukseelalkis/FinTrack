import 'package:flutter/material.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: AppStyles.outlineBorder(),
        focusedBorder: AppStyles.outlineBorder(width: 2),
      ),
    );
  }
}
