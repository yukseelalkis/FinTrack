import 'package:flutter/material.dart';
import 'package:mobil_app/product/mixin/format_date.dart';
import 'package:mobil_app/product/mixin/limited_leading.dart';
import 'package:mobil_app/feature/model/coin_model.dart';
import 'package:mobil_app/feature/model/listile_model.dart';
import 'package:mobil_app/feature/model/stock_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/enum/app_routes.dart';
import 'package:mobil_app/product/utilitiy/helper/navigator_helper.dart';

class CommonListTile extends StatelessWidget with FormatDate, LimitedLeading {
  final dynamic item;

  const CommonListTile({super.key, required this.item});

  /// burasi belki disari cikarilmak zorunda olabilir bunu soracaz
  ///
  ListTileContentModel? buildContentModel(dynamic item) {
    if (item is StockModel) {
      return ListTileContentModel(
        leading: limitToThreeChars(item.symbol),
        title: item.companyName,
        subtitle: item.industry,
        trailing: '\$${item.purchase.toStringAsFixed(2)}',
        isStock: true,
      );
    } else if (item is CoinModel) {
      return ListTileContentModel(
        leading: limitToThreeChars(item.symbol),
        title: item.name ?? '',
        subtitle: formatLastUpdated(item.lastUpdated),
        trailing: '\$${item.currentPrice?.toStringAsFixed(2) ?? '0.00'}',
        isStock: false,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final content = buildContentModel(item);
    if (content == null) return const SizedBox.shrink();

    return Padding(
      padding: const PagePadding.listTile(),
      child: Material(
        elevation: 5,
        borderRadius: AppStyles.borderRadius,
        shadowColor: AppColors.darkColor,
        child: ListTile(
          onTap: () {
            if (item is CoinModel) {
              NavigatorHelper.navigateToPage(
                context,
                AppRoute.cryptoDetail,
                data: item,
              );
            }
            if (item is StockModel) {
              NavigatorHelper.navigateToPage(
                context,
                AppRoute.stockDetail,
                data: item,
              );
            }
          },
          leading: content.isStock
              ? CircleAvatar(
                  radius: AppStyles.listTileRadius,
                  backgroundColor: AppColors.peachColor,
                  child: Text(
                    content.leading,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              : null,
          // Sirkey ismi
          title: Text(
            content.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          // Sirkt icon
          subtitle: content.isStock
              ? Row(
                  children: [
                    const Icon(Icons.business,
                        size: AppStyles.listTileIconSize,
                        color: AppColors.greyColor),
                    const SizedBox(width: 4),
                    Expanded(
                      // sirketin sektoru
                      child: Text(
                        content.subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.listtileSubtitleColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              // kripto icin Updated
              : Text(
                  content.subtitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                ),
          trailing: Column(
            // piyasa degeri yazacak
            children: [
              Text(
                ProjectItemsString.marketValue,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.listtileSubtitleColor,
                      fontSize: 12,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                content.trailing,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
