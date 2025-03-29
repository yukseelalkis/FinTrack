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

class MyTabbar extends StatelessWidget with _TabBarMixin {
  const MyTabbar({required TabController tabController})
      : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.tabBarDecoration,
      padding: const PagePadding.tabbar(),
      child: TabBar(controller: _tabController, tabs: buildTabItems()),
    );
  }
}

mixin _TabBarMixin  {
  List<Tab> buildTabItems() {
    return MyTabViewPage.values.map((tab) {
      return Tab(
        icon: Icon(tabIcons[tab]),
        text: tabTitles[tab],
      );
    }).toList();
  }
}
