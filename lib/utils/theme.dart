import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundmates/constants/color_constants.dart';
import 'package:soundmates/extensions/style_extensions.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/utils/text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstants.backgroundColor,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );

  static final AppBarTheme _appBarTheme = const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ColorConstants.primaryColor),
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppTextStyles.labelLarge(),
      padding: PaddingX.medium,
      shape: OutlineBorderX.smallRounded,
      foregroundColor: ColorConstants.secondaryTextColor,
      backgroundColor: ColorConstants.primaryColor,
    ),
  );
}
