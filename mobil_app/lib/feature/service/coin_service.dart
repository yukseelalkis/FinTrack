import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/coinModel.dart';

class CoinService {
  final Dio _dio;
  CoinService(this._dio);

  Future<List<CoinModel>> fetchPopularCoin(String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((e) => CoinModel.fromJson(e)).toList();
      } else {
        print('Durum Kodu: ${response.statusCode}');
      }
    } catch (e) {
      print('CoinService Hatası: $e');
    }
    return [];
  }
}
