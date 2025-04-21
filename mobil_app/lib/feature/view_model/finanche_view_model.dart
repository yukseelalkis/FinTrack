import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/stock_model.dart';
import 'package:mobil_app/feature/service/stock_service.dart';
import 'package:mobil_app/feature/view/financial_items_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class FinancialItemsModel extends State<FinancialItemsView> {
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
