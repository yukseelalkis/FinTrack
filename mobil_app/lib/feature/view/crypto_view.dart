import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/list_tile_mixin.dart';
import 'package:mobil_app/feature/view_model/crypto_view_model.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/widget/custom_app_bar.dart';

class CryptoView extends StatefulWidget {
  const CryptoView({super.key});

  @override
  State<CryptoView> createState() => _CryptoViewState();
}

class _CryptoViewState extends CryptoViewModel with CommandListTileMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
            decoration: AppStyles.backgroundGradientBox,
            child: buildCommonList(coinItems)),
      ),
    );
  }
}
