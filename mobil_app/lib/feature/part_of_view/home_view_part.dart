part of '../view/home_view.dart';

// _MyTabBarView
class _BottomNavBarWidget extends StatefulWidget {
  const _BottomNavBarWidget({
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  State<_BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<_BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget._tabController,
      children: const [FinancheView(), CryptoView(), FeeView()],
    );
  }
}

class _MyTabbar extends StatelessWidget {
  const _MyTabbar({required TabController tabController})
      : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.tabBarDecoration,
      padding: const PagePadding.tabbar(),
      child: TabBar(
        controller: _tabController,
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.secondaryColor,
        unselectedLabelColor: AppColors.greyColor,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        tabs: _MyTabViewPage.values.map((tab) {
          return Tab(
            icon: Icon(tabIcons[tab]),
            text: tabTitles[tab],
          );
        }).toList(),
      ),
    );
  }
}

enum _MyTabViewPage { Finanche, Crypto, Card }

final Map<_MyTabViewPage, IconData> tabIcons = {
  _MyTabViewPage.Finanche: Icons.account_balance_wallet_outlined,
  _MyTabViewPage.Crypto: Icons.currency_bitcoin,
  _MyTabViewPage.Card: Icons.credit_card,
};

final Map<_MyTabViewPage, String> tabTitles = {
  _MyTabViewPage.Finanche: 'Finance',
  _MyTabViewPage.Crypto: 'Crypto',
  _MyTabViewPage.Card: 'Card',
};
