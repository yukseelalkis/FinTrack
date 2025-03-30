import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/coinModel.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/feature/service/coin_service.dart';
import 'package:mobil_app/feature/service/stock_service.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
import 'package:mobil_app/product/utilitiy/extensions/context_extension.dart';

part 'finanche_mixin.dart';

class FinancheView extends StatefulWidget {
  const FinancheView({super.key});

  @override
  State<FinancheView> createState() => _FinancheViewState();
}

class _FinancheViewState extends State<FinancheView> {
  List<StockModel>? _stockItems;
  List<CoinModel>? _coinItems;
  late final StockService _stockService;
  late final CoinService _coinService;
  late final Dio _dio;
  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    super.initState();
    _stockService = StockService(_dio);
    _coinService = CoinService(_dio);
    fetchPopulerStock();
    fetchPopulerCoin();
  }

  // view model ile ayiracazgimiz kisim olacak
  Future<void> fetchPopulerStock() async {
    final fetchPopItems =
        await _stockService.fetchPopularStocks(ServicePath.stockPopuler.path);
    setState(() {
      _stockItems = fetchPopItems;
    });
  }

  Future<void> fetchPopulerCoin() async {
    final fetchPopItems =
        await _coinService.fetchPopularCoin(ServicePath.coinPopuler.path);
    setState(() {
      _coinItems = fetchPopItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: AppStyles.backRoundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const PagePadding.xsll(),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteOpacityColor,
                    borderRadius: AppStyles.borderRadius),
                child: const Text(
                  'Main portfolio',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: PagePadding.all(),
              child: Text(
                '\$ 7,466.20',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: context.width,
                decoration: AppStyles.frontRoundDecoration,
                child: SingleChildScrollView(
                  padding: const PagePadding.xsll(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _AddStockButton(),
                      const Text('Populer'),
                      _ListTile(items: _stockItems),
                      const SizedBox(height: 20),
                      const Text(
                        'Crypto Para Piyasası',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      // card
                      _CardListBuilder(coinItems: _coinItems)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// disari cikaracz
class _ListTile extends StatelessWidget {
  const _ListTile({
    required List<StockModel>? items,
  }) : _items = items;

  final List<StockModel>? _items;

  @override
  Widget build(BuildContext context) {
    if (_items == null || _items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // ! kaldirdim
      itemCount: _items.length,
      itemBuilder: (context, index) {
        // ! kaldirdim
        final stock = _items[index];
        return ListTile(
          contentPadding: const PagePadding.listTilePadding(),
          leading: CircleAvatar(
            radius: AppStyles.listTileRadius,
            backgroundColor: AppColors.peachColor,
            child: Text(
              stock.symbol.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontSize: 10,
              ),
            ),
          ),
          title: Text(
            stock.companyName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            stock.industry,
            style: const TextStyle(
              color: AppColors.greyColor,
              fontSize: 11,
            ),
          ),
          trailing: Text(
            '\$${stock.purchase.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.greenColor,
              fontSize: 13,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: Colors.white,
          dense: true,
          visualDensity: VisualDensity.compact,
        );
      },
    );
  }
}
