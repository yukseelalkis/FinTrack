import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/feature/service/stock_service.dart';
import 'package:mobil_app/feature/view/finanche_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class FinancheViewModel extends State<FinancheView> {
  List<StockModel>? stockItems;
  late final StockService stockService;
  late final Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    stockService = StockService(dio);
    fetchGetAllStock();
  }

  Future<void> fetchGetAllStock() async {
    final fetchAllItems =
        await stockService.fetchStocks(ServicePath.stockGetAll.path);
    setState(() {
      stockItems = fetchAllItems;
    });
  }
}
