import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.xsll() : super.all(15);
  const PagePadding.listTilePadding()
      : super.symmetric(horizontal: 8.0, vertical: 4.0);
  const PagePadding.tabbar() : super.symmetric(vertical: 4);
  const PagePadding.xOnlyTop() : super.only(top: 4);
  const PagePadding.horizontal() : super.symmetric(horizontal: 8);
  const PagePadding.topxs() : super.only(top: 8);

  /// Splash özel padding
  static EdgeInsets splashSymmetric(BuildContext context) =>
      EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08);
}

// /const EdgeInsets.all(10),
//const EdgeInsets.symmetric(horizontal: 8.0),