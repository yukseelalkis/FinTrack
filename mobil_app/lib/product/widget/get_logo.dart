import 'package:flutter/material.dart';

class GetLogo extends StatelessWidget {
  const GetLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/logo2.png',
      fit: BoxFit.contain,
    );
  }
}
