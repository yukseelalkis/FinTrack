import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/crypto_view.dart';
import 'package:mobil_app/feature/view/fee_view.dart';
import 'package:mobil_app/feature/view/finanche_view.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';

part '../part_of_view/home_view_part.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
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
        bottomNavigationBar: BottomAppBar(
          color: AppColors.transparent,
          notchMargin: _notchMargin,
          child: _MyTabbar(tabController: _tabController),
        ),
        body: _BottomNavBarWidget(tabController: _tabController),
      ),
    );
  }
}
