import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/format_date.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';

class CommonListTile extends StatelessWidget with FormatDate, LimitedLeading {
  final dynamic item;

  const CommonListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String leadingText = '';
    String titleText = '';
    String subtitleText = '';
    String trailingText = '';

    if (item is StockModel) {
      leadingText = limitToThreeChars(item.symbol);
      titleText = item.companyName;
      subtitleText = item.industry;
      trailingText = '\$${item.purchase.toStringAsFixed(2)}';
    } else if (item is CoinModel) {
      leadingText = limitToThreeChars(item.symbol);
      titleText = item.name ?? '';
      subtitleText = formatLastUpdated(item.lastUpdated);
      trailingText = '\$${item.currentPrice?.toStringAsFixed(2) ?? '0.00'}';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Material(
        elevation: 5,
        borderRadius: AppStyles.borderRadius,
        shadowColor: AppColors.darkColor,
        child: ListTile(
          leading: CircleAvatar(
            radius: AppStyles.listTileRadius,
            backgroundColor: AppColors.peachColor,
            child: Text(
              leadingText,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          title: Text(titleText),
          subtitle: Text(subtitleText),
          trailing: Text(
            trailingText,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.greenColor,
                ),
          ),
        ),
      ),
    );
  }
}

mixin LimitedLeading {
  String limitToThreeChars(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.length <= 3
        ? text.toUpperCase()
        : text.substring(0, 3).toUpperCase();
  }
}
