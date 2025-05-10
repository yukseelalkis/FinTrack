part of '../view/home_view.dart';

/// Header
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const PagePadding.xsll(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ProjectItemsString.portfolio,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
              ),
              TextButton.icon(
                onPressed: () {
                  NavigatorHelper.navigateToPage(context, AppRoute.getAll);
                },
                icon: const Icon(Icons.stacked_bar_chart_rounded,
                    color: Colors.white, size: 18),
                label: const Text(
                  "All Stock",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const PagePadding.all(),
          child: Text(ProjectItemsString.money,
              style: Theme.of(context).textTheme.headlineLarge),
        ),
      ],
    );
  }
}

class _HeaderWithAddButton extends StatelessWidget {
  const _HeaderWithAddButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(ProjectItemsString.populer,
            style: Theme.of(context).textTheme.titleMedium),
        const _AddStockButton(),
      ],
    );
  }
}

class _AddStockButton extends StatelessWidget {
  const _AddStockButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          NavigatorHelper.navigateToPage(context, AppRoute.financialItems);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}

///Body

class _HomeBody extends StatefulWidget {
  final List<StockModel> stockItems;
  final List<CoinModel> coinItems;

  const _HomeBody({required this.stockItems, required this.coinItems});

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> with CommandListTileMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: AppStyles.frontRoundDecoration,
      child: SingleChildScrollView(
        padding: const PagePadding.xsll(),
        child: Column(
          children: [
            const _HeaderWithAddButton(),
            buildCommonList(
              items: widget.stockItems,
              isLoading: false,
            ),
            Text(ProjectItemsString.cryptoText,
                style: Theme.of(context).textTheme.titleMedium),
            _CardListBuilder(coinItems: widget.coinItems)
          ],
        ),
      ),
    );
  }
}

/// Body Atomic

class _CardListBuilder extends StatelessWidget {
  const _CardListBuilder({
    required List<CoinModel>? coinItems,
  }) : _coinItems = coinItems;

  final List<CoinModel>? _coinItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.topxs(),
      child: SizedBox(
        height: AppStyles.cardSizedBox,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              (_coinItems?.length ?? 0) + 1, // sonuna bir item daha ekliyoruz
          itemBuilder: (context, index) {
            if (index == _coinItems!.length) {
              // + butonu
              return Padding(
                padding: const PagePadding.horizontal(),
                child: InkWell(
                  onTap: () {
                    NavigatorHelper.navigateToPage(context, AppRoute.crypto);
                  },
                  child: Container(
                    width: AppStyles.cardWidth,
                    decoration: AppStyles.addButtonDecoration,
                    child: const Center(
                      child: Icon(Icons.add,
                          size: AppStyles.addCardIcon,
                          color: AppColors.greenColor),
                    ),
                  ),
                ),
              );
            }
            final coin = _coinItems[index];
            return InkWell(
              onTap: () {
                NavigatorHelper.navigateToPage(context, AppRoute.cryptoDetail,
                    data: coin);
              },
              child: _CryptoCard(
                  name: coin.name ?? 'N/A',
                  price: '\$${coin.currentPrice?.toStringAsFixed(2) ?? '0.00'}',
                  change:
                      '${coin.priceChangePercentage24h?.toStringAsFixed(2) ?? '0.00'}%',
                  imageUrl: coin.image ?? '',
                  changeColor: (coin.priceChangePercentage24h ?? 0) >= 0
                      ? AppColors.greenColor
                      : AppColors.errorColor),
            );
          },
        ),
      ),
    );
  }
}

class _CryptoCard extends StatelessWidget {
  const _CryptoCard({
    required this.name,
    required this.price,
    required this.change,
    required this.imageUrl,
    required this.changeColor,
  });

  final String name;
  final String price;
  final String change;
  final String imageUrl;
  final Color changeColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.horizontal(),
      child: Container(
        width: AppStyles.cryptoCardContainer,
        padding: const PagePadding.xsll(),
        decoration: AppStyles.cryptoCardBorder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: AppStyles.radius,
              backgroundColor: AppColors.transparent,
            ),
            const SizedBox(height: 10),
            Text(
              name.toLowerCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.greyColor,
              ),
            ),
            Text(
              change,
              style: TextStyle(
                fontSize: 12,
                color: changeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
