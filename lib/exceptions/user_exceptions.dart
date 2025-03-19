import 'package:soundmates/constants/string_constants.dart';
import 'package:soundmates/enums/http_code.dart';
import 'package:soundmates/exceptions/failure.dart';

class UserExceptions extends Failure {
  UserExceptions({required super.statusCode, required super.message});

  factory UserExceptions.noAccessToken() => UserExceptions(statusCode: HttpCode.notFound, message: '');

  factory UserExceptions.unauthorized() =>
      UserExceptions(statusCode: HttpCode.unauthotized, message: StringConstants.unauthorized);

  @override
  List<Object?> get props => [statusCode, message];
}
