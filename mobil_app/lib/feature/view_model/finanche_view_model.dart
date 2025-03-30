//abstract class StateLearnViewModel extends State<stateManageLearn> {

import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/feature/service/coin_service.dart';
import 'package:mobil_app/feature/service/stock_service.dart';
import 'package:mobil_app/feature/view/finanche_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class FinancheViewModel extends State<FinancheView> {
  List<StockModel>? stockItems;
  List<CoinModel>? coinItems;
  late final StockService _stockService;
  late final CoinService _coinService;
  Future<void> fetchPopulerStock() async {
    final fetchPopItems =
        await _stockService.fetchPopularStocks(ServicePath.stockPopuler.path);
    setState(() {
      stockItems = fetchPopItems;
    });
  }

  Future<void> fetchPopulerCoin() async {
    final fetchPopItems =
        await _coinService.fetchPopularCoin(ServicePath.coinPopuler.path);
    setState(() {
      coinItems = fetchPopItems;
    });
  }
}
