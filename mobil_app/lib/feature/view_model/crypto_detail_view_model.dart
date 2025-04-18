import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/model/marketChartModel%20.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/feature/service/marketChartService.dart';
import 'package:mobil_app/feature/view/crypto_detail_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class CryptoDetailViewModel extends State<CryptoDetailView> {
  MarketChartModel? marketItems;
  late final Dio dio;
  late final MarketChartservice chartservice;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    chartservice = MarketChartservice(dio);
    fetchChartService(widget.item);
  }

  Future<void> fetchChartService(dynamic item) async {
    String identifier = '';

    if (item is CoinModel) {
      identifier = item.id ?? '';
    } else if (item is StockModel) {
      identifier = item.symbol;
    }

    final fetchChartItem = await chartservice
        .fetchChartModel('${ServicePath.coinGetStatistic.path}$identifier');
    setState(() {
      marketItems = fetchChartItem;
    });
  }

  String getItemSymbol() {
    if (widget.item is CoinModel) {
      return (widget.item as CoinModel).symbol?.toUpperCase() ?? 'Coin';
    } else if (widget.item is StockModel) {
      return (widget.item as StockModel).symbol.toUpperCase();
    } else {
      return 'Detail';
    }
  }

  List<FlSpot> buildSpots() {
    return marketItems!.prices.asMap().entries.map((entry) {
      final index = entry.key.toDouble();
      final price = entry.value.value;
      return FlSpot(index, price);
    }).toList();
  }
}
