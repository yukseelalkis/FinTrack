import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/service/coin_service.dart';
import 'package:mobil_app/feature/view/crypto_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class CryptoViewModel extends State<CryptoView> {
  List<CoinModel>? coinItems;
  late final CoinService coinService;
  late final Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    coinService = CoinService(dio);
    fetchGetAllCoin();
  }

  Future<void> fetchGetAllCoin() async {
    final fetchAllItems =
        await coinService.fetchPopularCoin(ServicePath.coinGetAll.path);
    setState(() {
      coinItems = fetchAllItems;
    });
  }
}
