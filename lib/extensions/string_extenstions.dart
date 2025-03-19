extension OptionalStringX on String? {
  bool get isNullOrEmpty {
    if (this == null) return true;
    return this!.trim().isEmpty;
  }
}
