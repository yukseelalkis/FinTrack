part of '../view/home_view.dart';

class _HeaderWithAddButton extends StatelessWidget {
  const _HeaderWithAddButton({
    super.key,
  });

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

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const PagePadding.xsll(),
          child: Container(
            decoration: AppStyles.homeDecoration,
            child: Text(
              ProjectItemsString.portfolio,
              style: Theme.of(context).textTheme.titleMedium,
            ),
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
                    NavigatorHelper.navigateToPage(context, const CryptoView());
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
            final coin = _coinItems![index];
            return _cryptoCard(
                name: coin.name ?? 'N/A',
                price: '\$${coin.currentPrice?.toStringAsFixed(2) ?? '0.00'}',
                change:
                    '${coin.priceChangePercentage24h?.toStringAsFixed(2) ?? '0.00'}%',
                imageUrl: coin.image ?? '',
                changeColor: (coin.priceChangePercentage24h ?? 0) >= 0
                    ? AppColors.greenColor
                    : AppColors.errorColor);
          },
        ),
      ),
    );
  }
}

class _cryptoCard extends StatelessWidget {
  const _cryptoCard({
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

class _AddStockButton extends StatelessWidget {
  const _AddStockButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          NavigatorHelper.navigateToPage(context, const FinancheView());
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
