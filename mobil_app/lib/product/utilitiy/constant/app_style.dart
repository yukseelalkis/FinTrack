import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';

class AppStyles {
  AppStyles._(); // new'lenmesin diye private constructor

  // sabitler

  static const double cardWidth = 100;
  static const double addCardIcon = 30;
  static const double cardSizedBox = 130;
  static const double cryptoCardContainer = 100;
  static const double blur = 5;
  static const double radius = 15;
  static const double listTileRadius = 22;
  static const Offset ofset = Offset(0, 2);
  static final BorderRadius borderRadius = BorderRadius.circular(10);
  static final BorderRadius borderRadius3xl = BorderRadius.circular(30);
  static const double loginIconSize = 62;
  static const double listTileIconSize = 16;
  static const double cardFontSize = 16;
  static const double cardIconSize = 16;

  static final BoxDecoration loginDecoration =
      BoxDecoration(color: Colors.white, borderRadius: borderRadius3xl);

  static final BoxDecoration tabBarDecoration = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(25),
  );
  static const InputConfiguration creditCardInputDecoration =
      InputConfiguration(
    cardNumberDecoration: InputDecoration(
      labelText: ProjectItemsString.cardNumber,
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

  static final Border addBorder =
      Border.all(color: AppColors.addCardBorderColor);

  static const BoxDecoration frontRoundDecoration = BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60), topRight: Radius.circular(60)));

  static final BoxDecoration cryptoCardBorder = BoxDecoration(
    color: AppColors.whiteColor,
    border: Border.all(color: AppColors.borderCardColor),
    borderRadius: AppStyles.borderRadius,
    boxShadow: [
      BoxShadow(
          color: AppColors.cryptoCardShadow,
          blurRadius: AppStyles.blur,
          offset: AppStyles.ofset)
    ],
  );

  static final BoxDecoration addButtonDecoration = BoxDecoration(
      color: AppColors.borderCardColor,
      borderRadius: AppStyles.borderRadius,
      border: AppStyles.addBorder);
  static final ShapeBorder listTileBorder =
      RoundedRectangleBorder(borderRadius: borderRadius);

  static const BoxDecoration backgroundGradientBox = BoxDecoration(
    gradient: AppColors.backgroundGradient,
  );
  static OutlineInputBorder outlineBorder({double width = 1.5}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: const Color.fromARGB(255, 30, 92, 148),
        width: width,
      ),
    );
  }

  static final BoxDecoration homeDecoration = BoxDecoration(
      color: AppColors.whiteOpacityColor, borderRadius: AppStyles.borderRadius);
  static final RoundedRectangleBorder elevantedButtonBorder =
      RoundedRectangleBorder(borderRadius: borderRadius3xl);
}
