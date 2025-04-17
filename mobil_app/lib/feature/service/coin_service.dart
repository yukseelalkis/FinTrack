import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/coinModel.dart';

abstract class ICoinService {
  final Dio dio;
  ICoinService(this.dio);
  Future<List<CoinModel>> fetchPopularCoin(String path);
}

class CoinService extends ICoinService {
  CoinService(super.dio);

  Future<List<CoinModel>> fetchPopularCoin(String path) async {
    try {
      final response = await dio.get(path);
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
