enum ServicePath {
  baseUrl('http://10.0.2.2:5284/api/'),
  stockPopuler('stock/popular?count=5'),
  stockGetAll('stock'),
  coinPopuler('coin/popular'),
  coinGetAll('coin/All');

  final String path;
  const ServicePath(this.path);
}

//  final String _stockPath = 'stock/popular?count=5';
