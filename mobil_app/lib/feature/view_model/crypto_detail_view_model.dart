import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/coin_model.dart';
import 'package:mobil_app/feature/model/chart_point_model.dart';
import 'package:mobil_app/feature/model/stock_model.dart';
import 'package:mobil_app/feature/service/market_chart_service.dart.dart';
import 'package:mobil_app/feature/view/crypto_detail_view.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/mixin/chart_selectable.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class CryptoDetailViewModel extends State<CryptoDetailView>
    with ChartSelectable
    implements ICryptoChartLoader {
  MarketChartModel? marketItems;
  late final Dio dio;
  late final MarketChartservice chartService;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    chartService = MarketChartservice(dio);
    loadChartData(widget.item);
  }

  @override
  Future<void> loadChartData(dynamic item) async {
    final String id = _resolveIdentifier(item);
    final String url = selectedChartPath.buildUrl(id);

    final data = await chartService.fetchChartModel(url);
    setState(() {
      marketItems = data;
    });
  }

  String _resolveIdentifier(dynamic item) {
    if (item is CoinModel) return item.id ?? '';
    if (item is StockModel) return item.symbol;
    return '';
  }

  String getItemSymbol() {
    if (widget.item is CoinModel) {
      return (widget.item as CoinModel).symbol?.toUpperCase() ?? 'COIN';
    } else if (widget.item is StockModel) {
      return (widget.item as StockModel).symbol.toUpperCase();
    }
    return ProjectItemsString.defaultDetail;
  }

  List<FlSpot> buildSpots() {
    return marketItems?.prices.asMap().entries.map((entry) {
          final index = entry.key.toDouble();
          final price = entry.value.value;
          return FlSpot(index, price);
        }).toList() ??
        [];
  }
}

abstract class ICryptoChartLoader {
  Future<void> loadChartData(dynamic item);
}
