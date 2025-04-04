import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/list_tile_mixin.dart';
import 'package:mobil_app/feature/view_model/finanche_view_model.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/widget/custom_app_bar.dart';

class FinancheView extends StatefulWidget {
  const FinancheView({super.key});

  @override
  State<FinancheView> createState() => _FinancheViewState();
}

class _FinancheViewState extends FinancheViewModel with CommandListTileMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
              decoration: AppStyles.backgroundLoginGradientBox,
              child: buildCommonList(stockItems)),
        ));
  }
}
