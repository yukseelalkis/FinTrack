import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/stock_model.dart';
import 'package:mobil_app/feature/service/stock_service.dart';
import 'package:mobil_app/feature/view/get_all_stock_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class GetAllStockViewModel extends State<GetAllStock> {
  List<StockModel>? stockItems;
  late final StockService stockService;
  late final Dio dio;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    stockService = StockService(dio);
    fetchGetAllStock();
  }

  Future<void> fetchGetAllStock() async {
    try {
      setState(() => isLoading = true);

      final response =
          await stockService.fetchStocks(ServicePath.stockGetAll.path);
      setState(() {
        stockItems = response;
      });
    } catch (e) {
      debugPrint("Hata: $e");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }
}
