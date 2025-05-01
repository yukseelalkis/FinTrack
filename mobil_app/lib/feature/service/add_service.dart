import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';

abstract class IAddService {
  final Dio dio;
  IAddService(this.dio);

  Future<bool> postSymbolStock({
    required String symbol,
    required String token,
  });

  final String _path = ServicePath.addPortfolio.path;
}

class AddService extends IAddService {
  AddService(super.dio);

  @override
  Future<bool> postSymbolStock({
    required String symbol,
    required String token,
  }) async {
    try {
      final response = await dio.post(
        '$_path$symbol',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      debugPrint('Şirket ekleme hatası: $e');
      return false;
    }
  }
}
