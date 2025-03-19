import 'package:flutter/material.dart';
import 'package:soundmates/constants/color_constants.dart';
import 'package:soundmates/utils/dimens.dart';
import 'package:vector_graphics/vector_graphics.dart';

extension BoxDecorationX on BoxDecoration {
  static BoxDecoration get circle =>
      BoxDecoration(border: Border.all(color: ColorConstants.surfaceColor), shape: BoxShape.circle);
}

extension OutlineBorderX on OutlinedBorder {
  static OutlinedBorder get smallRounded =>
      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimens.pt8)));
}

extension VectorGraphicX on VectorGraphic {
  static VectorGraphic makeIcon(String iconPath) => VectorGraphic(
    loader: AssetBytesLoader(iconPath),
    height: IconDimens.medium,
    width: IconDimens.medium,
    colorFilter: const ColorFilter.mode(ColorConstants.primaryTextColor, BlendMode.srcIn),
  );
}
