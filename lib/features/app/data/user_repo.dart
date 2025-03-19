import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/domain/app_user.dart';
import 'package:soundmates/exceptions/failure.dart';
import 'package:soundmates/exceptions/user_exceptions.dart';
import 'package:soundmates/features/app/data/user_service.dart';
import 'package:soundmates/utils/logger_config.dart';

final userRepoProvider = Provider<UserRepo>((ref) {
  final userService = ref.read(userServiceProvider);
  return UserRepoImpl(userService: userService);
});

abstract class UserRepo {
  Future<Either<Failure, AppUser>> getUser();
}

class UserRepoImpl extends UserRepo {
  final UserService _userService;

  UserRepoImpl({required UserService userService}) : _userService = userService;

  @override
  Future<Either<UserExceptions, AppUser>> getUser() async {
    try {
      final result = await _userService.getUser();
      return Right(result);
    } on UserExceptions catch (e) {
      return Left(e);
    } on Exception catch (e, stackTrace) {
      appLogger.severe('Unexpected error in [UserRepoImpl][getUser]', e, stackTrace);
      rethrow;
    }
  }
}
