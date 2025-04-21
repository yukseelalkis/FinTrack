class ChartPoint {
  final DateTime date;
  final double value;

  ChartPoint({required this.date, required this.value});

  factory ChartPoint.fromJson(Map<String, dynamic> json) {
    return ChartPoint(
      date: DateTime.parse(json['date']),
      value: (json['value'] as num).toDouble(),
    );
  }
}

class MarketChartModel {
  final List<ChartPoint> prices;
  final List<ChartPoint> marketCaps;
  final List<ChartPoint> totalVolumes;

  MarketChartModel({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  factory MarketChartModel.fromJson(Map<String, dynamic> json) {
    return MarketChartModel(
      prices:
          (json['prices'] as List).map((e) => ChartPoint.fromJson(e)).toList(),
      marketCaps: (json['marketCaps'] as List)
          .map((e) => ChartPoint.fromJson(e))
          .toList(),
      totalVolumes: (json['totalVolumes'] as List)
          .map((e) => ChartPoint.fromJson(e))
          .toList(),
    );
  }
}
