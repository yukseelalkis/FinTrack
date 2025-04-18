import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/payment_view.dart';
import 'package:mobil_app/feature/view_model/crypto_detail_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/helper/navigator_helper.dart';

part 'crypto_detail_part.dart';

class CryptoDetailView extends StatefulWidget {
  final dynamic item;
  const CryptoDetailView({super.key, required this.item});

  @override
  State<CryptoDetailView> createState() => _CryptoDetailViewState();
}

class _CryptoDetailViewState extends CryptoDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getItemSymbol())),
      body: marketItems == null
          ? const Center(child: CircularProgressIndicator())
          : marketItems!.prices.isEmpty
              ? const Center(child: Text(ProjectItemsString.none))
              : ListView(
                  padding: const PagePadding.all(),
                  children: [
                    const Text(
                      ProjectItemsString.priceChart,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const PagePadding.cryptoPageTop(),
                      child: SizedBox(
                        height: 260,
                        child: _PriceChart(spots: buildSpots()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _MarketInfoCard(
                        latestPrice: marketItems!.prices.last.value,
                        latestMarketCap: marketItems!.marketCaps.isNotEmpty
                            ? marketItems!.marketCaps.last.value
                            : null,
                        latestVolume: marketItems!.totalVolumes.isNotEmpty
                            ? marketItems!.totalVolumes.last.value
                            : null,
                      ),
                    ),
                    const Padding(
                      padding: PagePadding.cryptoPageTop(),
                      child: _BuyButton(),
                    ),
                  ],
                ),
    );
  }
}
