import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/stockDetailModel.dart';

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
        print('Durum Kodu: ${response.statusCode}');
      }
    } catch (e) {
      print('Hata: $e');
    }
    return [];
  }
}



/// adresi farkli kankamin    'http://localhost:5284/api/
/// stock?Symbol=NVDA' 
