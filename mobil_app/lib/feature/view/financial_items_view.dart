import 'package:flutter/material.dart';
import 'package:mobil_app/product/mixin/list_tile_mixin.dart';
import 'package:mobil_app/feature/view_model/finanche_view_model.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/widget/custom_app_bar.dart';

class FinancialItemsView extends StatefulWidget {
  const FinancialItemsView({super.key});

  @override
  State<FinancialItemsView> createState() => _FinancialItemsViewState();
}

class _FinancialItemsViewState extends FinancialItemsModel
    with CommandListTileMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onCompanyAdded: fetchGetAllPortfolio),
      body: SingleChildScrollView(
        child: Container(
            decoration: AppStyles.backgroundGradientBox,
            child: buildCommonList(
              items: stockItems,
              isLoading: isLoading,
              emptyMessage: 'Henüz portföyünüzde veri yok.',
            )),
      ),
    );
  }
}
