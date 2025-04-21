// VIEW MODEL
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/coin_model.dart';
import 'package:mobil_app/feature/model/stock_model.dart';
import 'package:mobil_app/feature/service/coin_service.dart';
import 'package:mobil_app/feature/service/stock_service.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class HomeViewModel extends State<HomeView> {
  List<StockModel>? stockItems;
  List<CoinModel>? coinItems;

  late final StockService stockService;
  late final CoinService coinService;
  late final Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    stockService = StockService(dio);
    coinService = CoinService(dio);
    fetchPopulerStock();
    fetchPopulerCoin();
  }

  Future<void> fetchPopulerStock() async {
    final fetchPopItems =
        await stockService.fetchStocks(ServicePath.stockPopuler.path);
    setState(() {
      stockItems = fetchPopItems;
    });
  }

  Future<void> fetchPopulerCoin() async {
    final fetchPopItems =
        await coinService.fetchPopularCoin(ServicePath.coinPopuler.path);
    setState(() {
      coinItems = fetchPopItems;
    });
  }
}
