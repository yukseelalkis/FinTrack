import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';

class AppStyles {
  AppStyles._(); // new'lenmesin diye private constructor

  static final BoxDecoration tabBarDecoration = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(25),
  );
  static const InputConfiguration creditCardInputDecoration =
      InputConfiguration(
    cardNumberDecoration: InputDecoration(
      labelText: ProjectItemsString.cardName,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      hintText: ProjectItemsString.cardHintText,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor, width: 2),
      ),
    ),
    expiryDateDecoration: InputDecoration(
      labelText: ProjectItemsString.expiryDate,
      hintText: ProjectItemsString.expiryDateHint,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor, width: 2),
      ),
    ),
    cvvCodeDecoration: InputDecoration(
      labelText: ProjectItemsString.cvvName,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor, width: 2),
      ),
    ),
    cardHolderDecoration: InputDecoration(
      labelText: ProjectItemsString.cardName,
      hintText: ProjectItemsString.cardNameHint,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor, width: 2),
      ),
    ),
  );

  /// Global TextTheme
  static const TextTheme textTheme = TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.darkColor,
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      color: AppColors.darkColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  /// Global ElevatedButton Style
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.peachColor, // Buton arka plan
    foregroundColor: AppColors.darkColor, // Yazı rengi
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  );
}
