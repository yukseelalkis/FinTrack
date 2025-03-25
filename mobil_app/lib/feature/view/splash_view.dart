import 'package:flutter/material.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/enum/lottie_enum.dart';
import 'package:mobil_app/product/utilitiy/extensions/context_extension.dart';
import 'package:mobil_app/product/widget/lottie.dart';

part '../part_of_view/splash_part.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PagePadding.splashSymmetric(context),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Lotie
            _Header(),
            // Texttt
            _TextColumn(),
          ],
        ),
      ),
    );
  }
}
