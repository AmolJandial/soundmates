import 'package:flutter/material.dart';
import 'package:soundmates/constants/color_constants.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const Color _defaultColor = ColorConstants.primaryTextColor;
  static const FontWeight _defaultWeight = FontWeight.w500;
  static const String _defaultFontFamily = 'Roboto';
  static const double _defaultLineHeight = 1.2;

  static TextStyle headlineSmall({
    Color color = _defaultColor,
    FontWeight weight = _defaultWeight,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
  }) => TextStyle(
    color: color,
    fontSize: 16,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );

  static TextStyle headlineMedium({
    Color color = _defaultColor,
    FontWeight weight = _defaultWeight,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
  }) => TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );

  static TextStyle headlineLarge({
    Color color = _defaultColor,
    FontWeight weight = _defaultWeight,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
  }) => TextStyle(
    color: color,
    fontSize: 24,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );

  static TextStyle labelLarge({
    Color color = _defaultColor,
    FontWeight weight = FontWeight.w600,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
    double fontSize = 20,
  }) => TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );

  static TextStyle bodyMedium({
    Color color = _defaultColor,
    FontWeight weight = _defaultWeight,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
  }) => TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );

  static TextStyle bodyLarge({
    Color color = _defaultColor,
    FontWeight weight = _defaultWeight,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
  }) => TextStyle(
    color: color,
    fontSize: 20,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );

  static TextStyle titleLarge({
    Color color = _defaultColor,
    FontWeight weight = FontWeight.bold,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
  }) => TextStyle(
    color: color,
    fontSize: 24,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );

  static TextStyle caption({
    Color color = _defaultColor,
    FontWeight weight = _defaultWeight,
    double? lineHeight,
    String fontFamily = _defaultFontFamily,
  }) => TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: weight,
    fontFamily: fontFamily,
    height: lineHeight ?? _defaultLineHeight,
  );
}
