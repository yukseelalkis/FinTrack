import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/get_all_stock_view.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/feature/view/login_view.dart';
import 'package:mobil_app/feature/view/payment_view.dart';
import 'package:mobil_app/feature/view/crypto_view.dart';
import 'package:mobil_app/feature/view/financial_items_view.dart';
import 'package:mobil_app/feature/view/crypto_detail_view.dart';
import 'package:mobil_app/feature/view/register_view.dart';
import 'package:mobil_app/feature/view/stock_detail_view.dart';
import 'package:mobil_app/product/utilitiy/enum/app_routes.dart';

extension AppRouteExtension on AppRoute {
  Widget getPage({dynamic data}) {
    switch (this) {
      case AppRoute.login:
        return const LoginView();
      case AppRoute.home:
        return const HomeView();
      case AppRoute.payment:
        return const PaymentView();
      case AppRoute.financialItems:
        return const FinancialItemsView();
      case AppRoute.crypto:
        return const CryptoView();
      case AppRoute.stockDetail:
        return StockDetail(stockItem: data);
      case AppRoute.cryptoDetail:
        return CryptoDetailView(item: data);
      case AppRoute.getAll:
        return const GetAllStock();
      case AppRoute.register:
        return const RegisterView();
    }
  }
}
