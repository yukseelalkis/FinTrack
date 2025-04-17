enum ServicePath {
  baseUrl('http://10.0.2.2:5284/api/'),
  stockPopuler('stock/popular?count=5'),
  stockGetAll('stock'),
  coinPopuler('coin/popular'),
  coinGetAll('coin/All'),
  stockBySymbol('stock?Symbol='),
  coinGetStatistic('coin/statistics?id=');

  final String path;
  const ServicePath(this.path);
}

//   // ✅ Eklenen kısım
