import 'package:flutter/material.dart';

class NavigatorHelper {
  const NavigatorHelper._(); // Bu sınıfın örneği oluşturulmasın diye

  /// Normal push ile sayfa geçişi
  static void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// pushReplacement ile geçiş (önceki sayfayı silerek)
  static void navigateAndReplace(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// pushAndRemoveUntil ile tüm geçmişi temizleyip yönlendirme
  static void navigateAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
