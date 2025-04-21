part of 'crypto_detail_view.dart';

class _PriceChart extends StatelessWidget {
  final List<FlSpot> spots;

  const _PriceChart({required this.spots});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: const FlTitlesData(show: false),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            dotData: const FlDotData(show: false),
            color: Colors.green,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

class _MarketInfoCard extends StatelessWidget {
  final double latestPrice;
  final double? latestMarketCap;
  final double? latestVolume;

  const _MarketInfoCard({
    required this.latestPrice,
    this.latestMarketCap,
    this.latestVolume,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              ProjectItemsString.marketInfo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.price_check, ProjectItemsString.latestPrice,
                formatNumber(latestPrice)),
            if (latestMarketCap != null)
              _buildInfoRow(Icons.pie_chart, ProjectItemsString.marketCap,
                  formatNumber(latestMarketCap!)),
            if (latestVolume != null)
              _buildInfoRow(Icons.bar_chart, ProjectItemsString.volume,
                  formatNumber(latestVolume!)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text(
            '$label:',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Büyük sayılar için kısaltılmış format
String formatNumber(double number) {
  if (number >= 1e12) return '\$${(number / 1e12).toStringAsFixed(2)}T';
  if (number >= 1e9) return '\$${(number / 1e9).toStringAsFixed(2)}B';
  if (number >= 1e6) return '\$${(number / 1e6).toStringAsFixed(2)}M';
  if (number >= 1e3) return '\$${(number / 1e3).toStringAsFixed(2)}K';
  return '\$${number.toStringAsFixed(2)}';
}

class _BuyButton extends StatelessWidget {
  const _BuyButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          NavigatorHelper.navigateToPage(context, AppRoute.payment),
      child: const Text(ProjectItemsString.buyButton),
    );
  }
}
