class ListTileContentModel {
  final String leading;
  final String title;
  final String subtitle;
  final String trailing;
  final String? lastUpdated;
  final bool isStock;

  ListTileContentModel({
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.isStock,
    this.lastUpdated,
  });
}
