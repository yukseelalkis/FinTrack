import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobil_app/feature/model/stock_model.dart';

abstract class IStockService {
  final Dio dio;
  IStockService(this.dio);
  Future<List<StockModel>?> fetchStocks(String path);
}

class StockService extends IStockService {
  StockService(super.dio);
  @override
  Future<List<StockModel>?> fetchStocks(String path) async {
    try {
      final response = await dio.get(path);
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => StockModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      debugPrint('Error fetching stock data: $e');
    }
    return null;
  }
}
