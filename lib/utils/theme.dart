import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundmates/constants/color_constants.dart';
import 'package:soundmates/extensions/style_extensions.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/utils/dimens.dart';
import 'package:soundmates/utils/text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstants.backgroundColor,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _textEditingTheme,
    textSelectionTheme: _textSelectionTheme,
    textButtonTheme: _textButtonTheme,
  );

  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: ColorConstants.primaryColor, textStyle: AppTextStyles.labelLarge()),
  );

  static final _textSelectionTheme = const TextSelectionThemeData(cursorColor: ColorConstants.primaryTextColor);

  static final _textEditingTheme = InputDecorationTheme(
    border: InputBorderX.smallRounded,
    focusedBorder: null,
    enabledBorder: null,
    errorBorder: null,
    disabledBorder: null,
    filled: true,
    fillColor: ColorConstants.surfaceColor,
    hintStyle: AppTextStyles.bodyMedium(color: ColorConstants.onSurfaceColor),
  );

  static final _appBarTheme = const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ColorConstants.primaryColor),
    backgroundColor: ColorConstants.transparent,
    elevation: Dimens.pt0,
    scrolledUnderElevation: Dimens.pt0,
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
