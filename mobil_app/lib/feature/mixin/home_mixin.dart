import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/product/utilitiy/enum/myTab_enum.dart';

mixin HomeMixin on TickerProviderStateMixin<HomeView> {
  late final TabController tabController;
  final double notchMargin = 10;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: MyTabViewPage.values.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
