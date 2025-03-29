import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.xsll() : super.all(10);

  const PagePadding.tabbar() : super.symmetric(vertical: 4);
  const PagePadding.xOnlyTop() : super.only(top: 4);

  /// Splash özel padding
  static EdgeInsets splashSymmetric(BuildContext context) =>
      EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08);
}
