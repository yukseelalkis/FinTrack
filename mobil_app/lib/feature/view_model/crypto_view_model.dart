import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/coin_model.dart';
import 'package:mobil_app/feature/service/coin_service.dart';
import 'package:mobil_app/feature/view/crypto_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

// abstract class CryptoViewModel extends State<CryptoView> {
//   List<CoinModel>? coinItems;
//   late final CoinService coinService;
//   late final Dio dio;

//   @override
//   void initState() {
//     super.initState();
//     dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
//     coinService = CoinService(dio);
//     fetchGetAllCoin();
//   }

//   Future<void> fetchGetAllCoin() async {
//     final fetchAllItems =
//         await coinService.fetchPopularCoin(ServicePath.coinGetAll.path);
//     setState(() {
//       coinItems = fetchAllItems;
//     });
//   }
// }


abstract class CryptoViewModel extends State<CryptoView> {
  List<CoinModel>? coinItems;
  late final CoinService coinService;
  late final Dio dio;

  bool isLoading = false; // ✅ eklendi

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    coinService = CoinService(dio);
    fetchGetAllCoin();
  }

  Future<void> fetchGetAllCoin() async {
    setState(() => isLoading = true); // ✅ loading başlat
    try {
      final fetchAllItems =
          await coinService.fetchPopularCoin(ServicePath.coinGetAll.path);
      if (!mounted) return;
      setState(() {
        coinItems = fetchAllItems;
      });
    } catch (e) {
      debugPrint('Coin verileri çekilemedi: $e');
    } finally {
      if (mounted) setState(() => isLoading = false); // ✅ loading bitir
    }
  }
}
