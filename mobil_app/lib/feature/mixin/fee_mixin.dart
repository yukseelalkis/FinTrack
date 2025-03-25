import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mobil_app/feature/view/fee_view.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';

mixin FeeMixin on State<FeeView> {
  // Sabitler
  String cardNumber = ''; // Başlangıçta Visa
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  // 
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(ProjectItemsString.snackBarPositive),
            backgroundColor: AppColors.doneColor,
          ),
        );
      } else {
        // Kart tipi desteklenmiyor
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(ProjectItemsString.snackBarNegative),
          backgroundColor: AppColors.errorColor,
        ));
      }
    } else {
      // Kredi karti hatali vs
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(ProjectItemsString.snackBarError),
            backgroundColor: AppColors.errorColor),
      );
    }
  }
}
