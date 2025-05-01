part of '../view/crypto_detail_view.dart';

class _PriceChart extends StatelessWidget {
  final List<FlSpot> spots;

  const _PriceChart({required this.spots});

  @override
  Widget build(BuildContext context) {
    final bool isDecreasing = spots.length >= 2 && spots.last.y < spots.first.y;

    final Color trendColor = isDecreasing ? Colors.red : Colors.green;

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                '\$${value.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.black87,
            getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
              return LineTooltipItem(
                '\$${spot.y.toStringAsFixed(2)}',
                const TextStyle(color: Colors.white),
              );
            }).toList(),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 3,
            color: trendColor,
            belowBarData: BarAreaData(
              show: true,
              color: trendColor.withOpacity(0.2),
            ),
            dotData: const FlDotData(show: false),
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
/// mixin yaoilacak burasi
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
