class StockModel {
  final int id;
  final String symbol;
  final String companyName;
  final double purchase;
  final double lastDiv;
  final String industry;
  final int marketCap;

  StockModel({
    required this.id,
    required this.symbol,
    required this.companyName,
    required this.purchase,
    required this.lastDiv,
    required this.industry,
    required this.marketCap,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'] as int,
      symbol: json['symbol'] ?? '',
      companyName: json['companyName'] ?? '',
      purchase: (json['purchase'] as num).toDouble(),
      lastDiv: (json['lastDiv'] as num).toDouble(),
      industry: json['industry'] ?? '',
      marketCap: json['marketCap'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'companyName': companyName,
      'purchase': purchase,
      'lastDiv': lastDiv,
      'industry': industry,
      'marketCap': marketCap,
    };
  }
}
