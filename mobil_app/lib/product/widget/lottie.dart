import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieName extends StatelessWidget {
  const LottieName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(
        _nameWithPath,
      ),
    );
  }

  String get _nameWithPath => 'assets/lottie/$name.json';
}
