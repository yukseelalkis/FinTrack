import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFFF56A48); // #f56a48 - (245,106,72)
  static const Color greenColor = Color(0xFF69C389); // #69c389 - (105,195,137)
  static const Color darkColor = Color(0xFF111822); // #111822 - (17,24,34)
  static const Color peachColor = Color(0xFFFBD4B1); // #fbd4b1 - (251,212,177)
  static const Color blueColor = Color(0xFF2972B6); // #2972b6 - (41,114,182)
  static const Color blueInputColor = Color.fromARGB(255, 30, 92, 148);
  static const Color appBarColor = Color(0xFF003861);
  // Diğer sabit renkler
  /// backroundColor white yapabiliriz bakacaz
  // static const Color backgroundColor =
  //     Color(0xFF2972B6); // #2972b6 - (41,114,182)
  static const Color backgroundColor =
      Color.fromARGB(255, 255, 255, 255); // #2972b6 - (41,114,182)
  static const Color textColor = Color(0xFF333333);
  static const Color greyColor = Colors.grey;
  static const Color transparent = Colors.transparent;
  static const Color errorColor = Colors.red;
  static const Color doneColor = Colors.green;
  static const Color whiteColor = Colors.white;
  static final Color whiteOpacityColor = Colors.white.withOpacity(0.5);
  static final Color borderCardColor = Colors.grey.shade200;
  static final Color addCardBorderColor = Colors.grey.shade300;
  static final Color cryptoCardShadow = Colors.grey.shade100;
  static final Color listtileSubtitleColor = Colors.grey.shade600;
  static final Color cardIconColor = Colors.grey.shade700;

  // Colors.grey.shade700,
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1E5C94), // (30, 92, 148)
      Color(0xFF2972B6), // (41, 114, 182)
      Color.fromARGB(255, 122, 182, 235), // (92, 155, 210)
    ],
  );
}

// /Colors.grey.shade100,


