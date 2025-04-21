import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mobil_app/feature/view/payment_view.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/duration/app_duration.dart';
import 'package:mobil_app/product/utilitiy/enum/app_routes.dart';
import 'package:mobil_app/product/utilitiy/helper/navigator_helper.dart';
import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';

abstract class PaymentViewModel extends State<PaymentView> {
  // Sabitler
  String cardNumber = ''; // Başlangıçta Visa
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  /// Validate Fonksiyon
  void onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      // Kart Tipini kontrol et
      if (cardNumber.startsWith('4') ||
          cardNumber.startsWith('5') ||
          cardNumber.startsWith('3')) {
        // Ödeme işlemini burada çağırabilirsin
        SnackbarHelper.showSuccess(
            context, ProjectItemsString.snackBarPositive);

        // Kısa gecikme sonrası yönlendirme
        Future.delayed(AppDuration.payDuration, () {
          if (mounted) {
            NavigatorHelper.navigateAndRemoveUntil(context, AppRoute.home);
          }
        });
      } else {
        // Kart tipi desteklenmiyor
        SnackbarHelper.showError(context, ProjectItemsString.snackBarNegative);
      }
    } else {
      // Kredi karti hatali vs

      SnackbarHelper.showError(context, ProjectItemsString.snackBarError);
    }
  }
}
