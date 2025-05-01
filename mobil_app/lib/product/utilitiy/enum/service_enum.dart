enum ServicePath {
  baseUrl('http://10.0.2.2:5284/api/'),
  stockPopuler('stock/popular?count=5'),
  stockGetAll('stock'),
  coinPopuler('coin/popular'),
  coinGetAll('coin/All'),
  stockBySymbol('stock?Symbol='),
  coinGet7DaysStatistic('coin/7daysstatistics?id='),
  coinGet15DaysStatistic('coin/15daysstatistics?id='),
  coinGet30DaysStatistic('coin/30daysstatistics?id='),
  addPortfolio('portfolio?symbol='); // 🔥 Düzelttik

  final String path;
  const ServicePath(this.path);
}
