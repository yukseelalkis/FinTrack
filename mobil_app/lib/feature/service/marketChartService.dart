import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/marketChartModel%20.dart';

abstract class IMarketChartService {
  final Dio dio;
  IMarketChartService(this.dio);
  Future<MarketChartModel?> fetchChartModel(String path);
}

class MarketChartservice extends IMarketChartService {
  MarketChartservice(super.dio);

  Future<MarketChartModel?> fetchChartModel(String path) async {
    try {
      final response = await dio.get(path);
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
