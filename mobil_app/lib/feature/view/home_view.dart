import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/home_mixin.dart';
import 'package:mobil_app/feature/view/crypto_view.dart';
import 'package:mobil_app/feature/view/fee_view.dart';
import 'package:mobil_app/feature/view/finanche_view.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/enum/myTab_enum.dart';

part '../part_of_view/home_view_part.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MyTabViewPage.values.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: AppColors.transparent,
          notchMargin: notchMargin,
          child: MyTabbar(tabController: tabController),
        ),
        body: _BottomNavBarWidget(tabController: tabController),
      ),
    );
  }
}
