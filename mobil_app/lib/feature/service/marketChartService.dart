import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/marketChartModel%20.dart';

class MarketChartservice {
  final Dio _dio;
  MarketChartservice(this._dio);

  Future<MarketChartModel?> fetchChartModel(String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return MarketChartModel.fromJson(data);
      } else {
        print('Durum Kodu: ${response.statusCode}');
      }
    } catch (e) {
      print('MarketchartProblem: $e');
    }
    return null;
  }
}
