import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view_model/get_all_stock_view_model.dart';
import 'package:mobil_app/product/mixin/list_tile_mixin.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/widget/custom_app_bar.dart';

class GetAllStock extends StatefulWidget with CommandListTileMixin {
  const GetAllStock({super.key});

  @override
  State<GetAllStock> createState() => _GetAllStockState();
}

class _GetAllStockState extends GetAllStockViewModel with CommandListTileMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // buradaki islem icin beklenmesi gerekiyor
        onCompanyAdded: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: AppStyles.backgroundGradientBox,
          child: buildCommonList(items: stockItems, isLoading: isLoading),
        ),
      ),
    );
  }
}
