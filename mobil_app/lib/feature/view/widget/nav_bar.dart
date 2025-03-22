import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/crypto_view.dart';
import 'package:mobil_app/feature/view/fee_view.dart';
import 'package:mobil_app/feature/view/finanche_view.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchMargin = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViewPage.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViewPage.values.length,
      child: Scaffold(
        extendBody: false,
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: Colors.transparent,
          notchMargin: _notchMargin,
          child: _MyTabbar(tabController: _tabController),
        ),
        body: _BottomNavBarWidget(tabController: _tabController),
      ),
    );
  }
}

// _MyTabBarView
class _BottomNavBarWidget extends StatefulWidget {
  const _BottomNavBarWidget({
    super.key,
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

// My Tabbar  en som yapilacak sebebi vasr

class _MyTabbar extends StatelessWidget {
  const _MyTabbar({super.key, required TabController tabController})
      : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Color.fromRGBO(245, 106, 72, 1),
        labelColor: Color.fromRGBO(245, 106, 72, 1),
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        indicatorWeight: 2,
        tabs: const [
          Tab(
              icon: Icon(Icons.account_balance_wallet_outlined),
              text: "Finance"),
          Tab(icon: Icon(Icons.currency_bitcoin), text: "Crypto"),
          Tab(icon: Icon(Icons.credit_card), text: "Card"),
        ],
      ),
    );
  }
}

enum _MyTabViewPage { Finanche, Crypto, Card }

final Map<_MyTabViewPage, IconData> _tabIcons = {
  _MyTabViewPage.Finanche: Icons.account_balance_wallet_outlined,
  _MyTabViewPage.Crypto: Icons.currency_bitcoin,
  _MyTabViewPage.Card: Icons.credit_card,
};

final Map<_MyTabViewPage, String> _tabTitles = {
  _MyTabViewPage.Finanche: 'Finance',
  _MyTabViewPage.Crypto: 'Crypto',
  _MyTabViewPage.Card: 'Card',
};
