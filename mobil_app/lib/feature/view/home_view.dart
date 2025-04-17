import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/list_tile_mixin.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/feature/view/crypto_view.dart';
import 'package:mobil_app/feature/view/crypto_detail_view.dart';
import 'package:mobil_app/feature/view/financial_items_view.dart';
import 'package:mobil_app/feature/view_model/home_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/extensions/context_extension.dart';
import 'package:mobil_app/product/utilitiy/helper/navigator_helper.dart';

part '../part_of_view/home_view_part.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel with CommandListTileMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: AppStyles.backgroundGradientBox,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            Expanded(
                child: _HomeBody(
                    stockItems: stockItems ?? [], coinItems: coinItems ?? [])),
          ],
        ),
      ),
    );
  }
}


