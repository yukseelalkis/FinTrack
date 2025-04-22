enum CoinChartPath {
  day7,
  day15,
  day30;

  String buildUrl(String id) {
    switch (this) {
      case CoinChartPath.day7:
        return 'coin/7daysstatistics?id=$id';
      case CoinChartPath.day15:
        return 'coin/15daysstatistics?id=$id';
      case CoinChartPath.day30:
        return 'coin/30daysstatistics?id=$id';
    }
  }
}
