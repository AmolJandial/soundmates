import 'package:flutter/material.dart';
import 'package:soundmates/constants/color_constants.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle headlineSmall({
    Color color = ColorConstants.primaryTextColor,
    FontWeight weight = FontWeight.w500,
  }) => TextStyle(color: color, fontSize: 16, fontWeight: weight);

  static TextStyle labelLarge({Color color = ColorConstants.primaryTextColor, FontWeight weight = FontWeight.w600}) =>
      TextStyle(color: color, fontSize: 20, fontWeight: weight);
}
