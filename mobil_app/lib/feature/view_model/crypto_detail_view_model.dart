import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/coin_model.dart';
import 'package:mobil_app/feature/model/chart_point_model.dart';
import 'package:mobil_app/feature/model/stock_model.dart';
import 'package:mobil_app/feature/service/market_chart_service.dart.dart';
import 'package:mobil_app/feature/view/crypto_detail_view.dart';
import 'package:mobil_app/product/mixin/chart_selectable.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

// abstract class CryptoDetailViewModel extends State<CryptoDetailView> {
//   MarketChartModel? marketItems;
//   late final Dio dio;
//   late final MarketChartservice chartservice;

//   @override
//   void initState() {
//     super.initState();
//     dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
//     chartservice = MarketChartservice(dio);
//     fetchChartService(widget.item);
//   }

//   Future<void> fetchChartService(dynamic item) async {
//     String identifier = '';

//     if (item is CoinModel) {
//       identifier = item.id ?? '';
//     } else if (item is StockModel) {
//       identifier = item.symbol;
//     }

//     final fetchChartItem = await chartservice.fetchChartModel(
//         '${ServicePath.coinGet7DaysStatistic.path}$identifier');
//     setState(() {
//       marketItems = fetchChartItem;
//     });
//   }

//   String getItemSymbol() {
//     if (widget.item is CoinModel) {
//       return (widget.item as CoinModel).symbol?.toUpperCase() ?? 'Coin';
//     } else if (widget.item is StockModel) {
//       return (widget.item as StockModel).symbol.toUpperCase();
//     } else {
//       return 'Detail';
//     }
//   }

//   List<FlSpot> buildSpots() {
//     return marketItems!.prices.asMap().entries.map((entry) {
//       final index = entry.key.toDouble();
//       final price = entry.value.value;
//       return FlSpot(index, price);
//     }).toList();
//   }
// }
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
    return 'DETAIL';
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
