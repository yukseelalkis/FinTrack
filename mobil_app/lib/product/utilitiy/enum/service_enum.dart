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
  getPortFolio('Portfolio'),
  addPortfolio('portfolio?symbol='); // 🔥 Düzelttik

  final String path;
  const ServicePath(this.path);
}


/// post icin simdi get icin yapacaz
/// 
//  'Portfolio?symbol=u' \



///'http://localhost:5284/api/Portfolio'