import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/list_tile_mixin.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/view_model/home_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/extensions/context_extension.dart';

part 'home_view_part.dart';

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
        decoration: AppStyles.backRoundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            Expanded(
              child: Container(
                width: context.width,
                decoration: AppStyles.frontRoundDecoration,
                child: SingleChildScrollView(
                  padding: const PagePadding.xsll(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _HeaderWithAddButton(),
                      buildCommonList(stockItems),
                      Text(ProjectItemsString.cryptoText,
                          style: Theme.of(context).textTheme.titleMedium),
                      _CardListBuilder(coinItems: coinItems)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
