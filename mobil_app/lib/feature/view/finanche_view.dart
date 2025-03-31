import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/list_tile_mixin.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/view_model/finanche_view_model.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/extensions/context_extension.dart';

part 'finanche_part.dart';

class FinancheView extends StatefulWidget {
  const FinancheView({super.key});

  @override
  State<FinancheView> createState() => _FinancheViewState();
}

class _FinancheViewState extends FinancheViewModel with CommandListTileMixin {
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
            Padding(
              padding: const PagePadding.xsll(),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteOpacityColor,
                    borderRadius: AppStyles.borderRadius),
                child: const Text(
                  'Main portfolio',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: PagePadding.all(),
              child: Text(
                '\$ 7,466.20',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: context.width,
                decoration: AppStyles.frontRoundDecoration,
                child: SingleChildScrollView(
                  padding: const PagePadding.xsll(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Populer',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          _AddStockButton(),
                        ],
                      ),
                      buildCommonList(stockItems),
                      const SizedBox(height: 20),
                      const Text(
                        'Crypto Para Piyasası',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
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
