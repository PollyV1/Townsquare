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
  static Color greyText = HexColor("#ADB5BD");
  static Color selectedPurple = HexColor("#baa1c8");
  static Color notSelectedPurple = HexColor("#e5d5ee");
}
