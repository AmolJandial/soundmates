import 'package:flutter/material.dart';
import 'package:soundmates/utils/dimens.dart';

extension WidgetX on Widget {
  Widget expand() => SizedBox.expand(child: this);
  Widget contraintWidth(double width) => SizedBox(width: width, child: this);
  Widget withColor() => ColoredBox(color: Colors.amber, child: this);
  Widget withSafeArea() => SafeArea(child: this);

  Widget withPaddingSmallAll() => Padding(padding: const EdgeInsets.all(Dimens.pt8), child: this);
  Widget withPaddingHorizontalSmall() =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: Dimens.pt8), child: this);
}

extension PaddingX on Padding {
  static EdgeInsetsGeometry get verySmall => const EdgeInsets.all(Dimens.pt4);
  static EdgeInsetsGeometry get small => const EdgeInsets.all(Dimens.pt8);
  static EdgeInsetsGeometry get medium => const EdgeInsets.all(Dimens.pt16);
}
