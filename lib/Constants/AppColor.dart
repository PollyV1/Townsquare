import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColors {
  static Color blueBanner = HexColor("#c8ecfc");
  static Color greenButton = HexColor("#d8f7df");
  static Color greyText = HexColor("#adb5bd");
  static Color darkerGrey = HexColor("#6c757d");
  static Color greyBackground = HexColor("#e9ecef");
  static Color selectedPurple = HexColor("#baa1c8");
  static Color notSelectedPurple = HexColor("#e5d5ee");
  static Color blueButton = HexColor("#d5f1ff");
  static Color purpleButton = HexColor("#f3e8ff");
  static Color orangeButton = HexColor("#ffead1");
  static Color blueFont = HexColor("#65b5db");
  static Color purpleFont = HexColor("#c9a4f2");
  static Color orangeFont = HexColor("#dc974f");
  static Color greenFont = HexColor("#8ab58a");
}

Color getIntensityColor(String intensity) {
  switch (intensity.toLowerCase()) {
    case 'very high':
      return Colors.red;
    case 'high':
      return AppColors.orangeButton;
    case 'medium':
      return AppColors.purpleButton;
    case 'light':
      return AppColors.blueButton;
    default:
      return Colors.grey; // Fallback color
  }
}

Color getFontColor(String intensity) {
  switch (intensity.toLowerCase()) {
    case 'very high':
      return const Color.fromARGB(255, 102, 14, 8);
    case 'high':
      return AppColors.orangeFont;
    case 'medium':
      return AppColors.purpleFont;
    case 'light':
      return AppColors.blueFont;
    default:
      return Colors.black; // Fallback color
  }
}
