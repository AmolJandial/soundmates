import 'package:equatable/equatable.dart';
import 'package:soundmates/enums/http_code.dart';

abstract class Failure with EquatableMixin implements Exception {
  final HttpCode statusCode;
  final String message;

  const Failure({required this.statusCode, required this.message});
}
