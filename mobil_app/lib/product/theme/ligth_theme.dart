import 'package:flutter/material.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';

class LightTheme {
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,

      /// AppBar Ayarları
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.darkColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: AppColors.darkColor),
      ),

      /// Global TextTheme
      textTheme: AppStyles.textTheme, // ✅ Text Theme bağlandı

      /// Global ElevatedButtonTheme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.elevatedButtonStyle, // ✅ Buton rengi peach
      ),

      /// InputDecoration (TextField) Ayarları
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.darkColor),
        hintStyle: TextStyle(color: AppColors.greenColor),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greenColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greenColor),
        ),
      ),
    );
  }
}
