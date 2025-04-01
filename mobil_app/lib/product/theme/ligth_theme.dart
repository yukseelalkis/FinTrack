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
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 18, color: Colors.white),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 13, color: AppColors.darkColor),
          bodySmall: TextStyle(fontSize: 12, color: AppColors.greyColor),
          labelSmall: TextStyle(fontSize: 15, color: AppColors.greyColor),
          //
        ),


    
        /// Global ElevatedButtonTheme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueColor,
            shape: AppStyles.elevantedButtonBorder,
            foregroundColor:
                AppColors.whiteColor, // Buton üzerindeki yazı rengi
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
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
        tabBarTheme: const TabBarTheme(
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.darkColor,
        ));
  }
}
