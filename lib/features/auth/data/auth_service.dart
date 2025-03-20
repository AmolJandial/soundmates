import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/domain/app_user.dart';
import 'package:soundmates/enums/http_code.dart';
import 'package:soundmates/exceptions/auth_exceptions.dart';
import 'package:soundmates/extensions/string_extenstions.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  Future<AppUser> login(String accessToken) async {
    throw UnimplementedError();
  }

  Future<void> verifyOtp(String phoneNumber, String countryCode, String otp) async {
    if (otp.isNullOrEmpty) {
      throw AuthException.emptyOtp();
    }

    // todo: make verify otp request to api
    final response = await Future.delayed(2.seconds, () => 200);

    // todo: handle error status code
    if (response == HttpCode.invalidFormat.statusCode) {
      throw AuthException.invalidOtp();
    }
  }

  Future<void> verifyPhone(String phoneNumber, String countryCode) async {
    if (phoneNumber.isNullOrEmpty) {
      throw AuthException.emptyPhoneNumber();
    }
    // todo: make verifyphone request to api
    final response = await Future.delayed(2.seconds, () => 200);

    // todo: if response status code != 200, means some error occured so handle it
    if (response == HttpCode.invalidFormat.statusCode) {
      throw AuthException.invalidNumber('$countryCode$phoneNumber');
    }

    // todo: number is correct, otp will be sent soon
  }
}
