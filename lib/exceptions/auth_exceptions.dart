import 'package:soundmates/enums/http_code.dart';
import 'package:soundmates/exceptions/failure.dart';

class AuthException extends Failure {
  AuthException({required super.statusCode, required super.message});

  factory AuthException.emptyPhoneNumber() =>
      AuthException(statusCode: HttpCode.badRequest, message: 'Please enter a phone number');

  factory AuthException.emptyOtp() =>
      AuthException(statusCode: HttpCode.badRequest, message: 'Please enter the OTP code');

  factory AuthException.invalidNumber(String number) =>
      AuthException(statusCode: HttpCode.invalidFormat, message: '$number is not a valid phone number');

  factory AuthException.invalidOtp() =>
      AuthException(statusCode: HttpCode.invalidFormat, message: 'Please enter correct OTP code');

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [statusCode, message];
}
