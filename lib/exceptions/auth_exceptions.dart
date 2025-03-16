import 'package:equatable/equatable.dart';
import 'package:soundmates/enums/http_code.dart';
import 'package:soundmates/exceptions/failure.dart';

class AuthException extends Failure with EquatableMixin {
  AuthException({required super.statusCode, required super.message});

  factory AuthException.emptyPhoneNumber(String message) =>
      AuthException(statusCode: HttpCode.badRequest.statusCode, message: message);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [statusCode, message];
}
