import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get maxHeight => MediaQuery.sizeOf(this).height;
  double get maxWidth => MediaQuery.sizeOf(this).width;
}
