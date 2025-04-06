import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/fee_view.dart';
import 'package:mobil_app/feature/view_model/detail_view_model.dart';
import 'package:mobil_app/product/utilitiy/navigator/navigator_helper.dart';

class DetailView extends StatefulWidget {
  final dynamic item; // CoinModel veya StockModel olabilir

  const DetailView({super.key, required this.item});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends DetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(getItemSymbol()),
      ),
      body: marketItems == null
          ? const Center(child: CircularProgressIndicator())
          : marketItems!.prices.isEmpty
              ? const Center(child: Text("Veri bulunamadı"))
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Özet Kart
                    const Text(
                      "Price Chart",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(height: 300, child: buildPriceChart()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildInfoCard(),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          NavigatorHelper.navigateToPage(context, FeeView());
                        },
                        child: const Text('Satin Al'))
                  ],
                ),
    );
  }

  Widget buildInfoCard() {
    final latestPrice = marketItems!.prices.last.value;
    final latestMarketCap = marketItems!.marketCaps.isNotEmpty
        ? marketItems!.marketCaps.last.value
        : null;
    final latestVolume = marketItems!.totalVolumes.isNotEmpty
        ? marketItems!.totalVolumes.last.value
        : null;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fiyat: \$${latestPrice.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16)),
            if (latestMarketCap != null)
              Text("Market Cap: \$${latestMarketCap.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16)),
            if (latestVolume != null)
              Text("Hacim: \$${latestVolume.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget buildPriceChart() {
    final List<FlSpot> spots = marketItems!.prices.asMap().entries.map(
      (entry) {
        final index = entry.key.toDouble();
        final price = entry.value.value;
        return FlSpot(index, price);
      },
    ).toList();

    return LineChart(
      LineChartData(
        titlesData: const FlTitlesData(show: false),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            dotData: FlDotData(show: false),
            color: Colors.green,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
