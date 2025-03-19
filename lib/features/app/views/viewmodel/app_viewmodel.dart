import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/features/app/data/user_repo.dart';
import 'package:soundmates/features/app/views/viewmodel/app_state.dart';
import 'package:soundmates/providers/pref_provider.dart';
import 'package:soundmates/utils/logger_config.dart';

final appViewmodelProvider = AutoDisposeAsyncNotifierProvider<AppViewmodel, AppState>(AppViewmodel.new);

class AppViewmodel extends AutoDisposeAsyncNotifier<AppState> {
  @override
  FutureOr<AppState> build() async {
    await _init();
    _userRepo = ref.read(userRepoProvider);
    final appState = await _getUser();
    return appState;
  }

  Future<void> _init() async {
    await ref.read(prefProvider.future);
  }

  Future<AppState> _getUser() async {
    final result = await _userRepo.getUser();
    final appState = result.fold(
      (failure) {
        appLogger.info('get user returned with a failure');
        return const AppState(userStatus: UserStatus.unauthenticated, errorMessage: '');
      },
      (user) {
        appLogger.info('get user returned with a user');
        return AppState(userStatus: UserStatus.authenticated, errorMessage: '', user: user);
      },
    );
    return appState;
  }

  late final UserRepo _userRepo;
}
