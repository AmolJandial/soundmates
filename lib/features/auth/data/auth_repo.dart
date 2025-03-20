import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/exceptions/auth_exceptions.dart';
import 'package:soundmates/exceptions/failure.dart';
import 'package:soundmates/domain/app_user.dart';
import 'package:soundmates/features/auth/data/auth_service.dart';
import 'package:soundmates/utils/logger_config.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  final service = ref.read(authServiceProvider);
  return FakeAuthRepoImpl(authService: service);
});

abstract class AuthRepo {
  Future<Either<Failure, void>> verifyPhone(String phoneNumber, String countryCode);

  Future<Either<Failure, void>> verifyOtp(String phoneNumber, String countryCode, String otp);

  Future<Either<Failure, AppUser>> login();

  Future<Either<Failure, void>> register();
}

class FakeAuthRepoImpl implements AuthRepo {
  final AuthService _authService;

  const FakeAuthRepoImpl({required AuthService authService}) : _authService = authService;

  @override
  Future<Either<Failure, AppUser>> login() async {
    await Future.delayed(const Duration(seconds: 2));
    return const Right(AppUser(id: '123345'));
  }

  @override
  Future<Either<Failure, void>> register() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String phoneNumber, String countryCode, String otp) async {
    try {
      await _authService.verifyOtp(phoneNumber, countryCode, otp);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception catch (e, stackTrace) {
      appLogger.severe(e.toString(), e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<Either<Failure, void>> verifyPhone(String phoneNumber, String countryCode) async {
    try {
      await _authService.verifyPhone(phoneNumber, countryCode);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception catch (e, stackTrace) {
      appLogger.severe(e.toString(), e, stackTrace);
      rethrow;
    }
  }
}
