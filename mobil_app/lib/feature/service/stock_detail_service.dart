import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/stock_detail_model.dart';

class StockDetailService {
  final Dio _dio;
  StockDetailService(this._dio);

  Future<List<StockDetailModel>> fetchGetSymbolDetail(String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((e) => StockDetailModel.fromJson(e)).toList();
      } else {
        debugPrint('Durum Kodu: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Hata: $e');
    }
    return [];
  }
}
