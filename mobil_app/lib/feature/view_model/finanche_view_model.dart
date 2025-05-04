import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/stock_model.dart';
import 'package:mobil_app/feature/service/stock_service.dart';
import 'package:mobil_app/feature/view/financial_items_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FinancialItemsModel extends State<FinancialItemsView> {
  List<StockModel>? stockItems;
  late final StockService stockService;
  late final Dio dio;

  bool isLoading = false; // 🔥 Yükleme durumu

  @override
  void initState() {
    super.initState(); // Bu satır eksikti, mutlaka en başta çağrılmalı
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    stockService = StockService(dio);
    fetchGetAllPortfolio();
  }

  Future<void> fetchGetAllPortfolio() async {
    try {
      setState(() => isLoading = true);

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('user_token') ?? '';

      if (token.isEmpty) {
        debugPrint("Token bulunamadı.");
        return;
      }

      final response = await dio.get(
        ServicePath.getPortFolio.path,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List;
        setState(() {
          stockItems = data.map((e) => StockModel.fromJson(e)).toList();
        });
      } else {
        debugPrint("Veri çekme başarısız: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Hata oluştu: $e");
    } finally {
      if (mounted) setState(() => isLoading = false); // ✅ Yükleme bitti
    }
  }
}
