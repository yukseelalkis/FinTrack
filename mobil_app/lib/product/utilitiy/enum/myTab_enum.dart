import 'package:flutter/material.dart';

enum MyTabViewPage { finanche, crypto, card }

final Map<MyTabViewPage, IconData> tabIcons = {
  MyTabViewPage.finanche: Icons.account_balance_wallet_outlined,
  MyTabViewPage.crypto: Icons.currency_bitcoin,
  MyTabViewPage.card: Icons.credit_card,
};

final Map<MyTabViewPage, String> tabTitles = {
  MyTabViewPage.finanche: 'Finance',
  MyTabViewPage.crypto: 'Crypto',
  MyTabViewPage.card: 'Card',
};
