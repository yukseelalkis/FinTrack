import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/format_date.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';

class CommonListTile extends StatelessWidget with FormatDate {
  final dynamic item;

  const CommonListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String leadingText = '';
    String titleText = '';
    String subtitleText = '';
    String trailingText = '';

    // StockModel için veri ayarlama
    if (item is StockModel) {
      leadingText = item.symbol.toUpperCase();
      titleText = item.companyName;
      subtitleText = item.industry;
      trailingText = '\$${item.purchase.toStringAsFixed(2)}';
    }
    // CoinModel için veri ayarlama
    else if (item is CoinModel) {
      leadingText = item.symbol?.toUpperCase() ?? '';
      titleText = item.name ?? '';
      subtitleText = formatLastUpdated(item.lastUpdated);
      trailingText = '\$${item.currentPrice?.toStringAsFixed(2) ?? '0.00'}';
    }

    return ListTile(
      contentPadding: const PagePadding.listTilePadding(),
      leading: CircleAvatar(
        radius: AppStyles.listTileRadius,
        backgroundColor: AppColors.peachColor,
        child: Text(
          leadingText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            fontSize: 10,
          ),
        ),
      ),
      title: Text(
        titleText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: AppColors.darkColor,
        ),
      ),
      subtitle: Text(
        subtitleText,
        style: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 11,
        ),
      ),
      trailing: Text(
        trailingText,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.greenColor,
          fontSize: 13,
        ),
      ),
      shape: AppStyles.listTileBorder,
      tileColor: AppColors.whiteColor,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
