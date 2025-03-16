import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/exceptions/auth_exceptions.dart';
import 'package:soundmates/exceptions/failure.dart';
import 'package:soundmates/features/app/domain/app_user.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  return FakeAuthRepoImpl();
});

abstract class AuthRepo {
  Future<Either<Failure, void>> verifyPhone();

  Future<Either<Failure, void>> verifyOtp();

  Future<Either<Failure, AppUser>> login();

  Future<Either<Failure, void>> register();
}

class FakeAuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, AppUser>> login() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('unexpected');
    throw AuthException.emptyPhoneNumber('Please provider a phone number');
    return const Right(AppUser(id: '123345'));
  }

  @override
  Future<Either<Failure, void>> register() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyOtp() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyPhone() {
    throw UnimplementedError();
  }
}
