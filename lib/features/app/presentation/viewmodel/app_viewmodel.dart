import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/features/app/data/auth_repo.dart';

final appViewmodelProvider = AutoDisposeAsyncNotifierProvider<AppViewmodel, void>(AppViewmodel.new);

class AppViewmodel extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> login() async {
    final authRepo = ref.read(authRepoProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await authRepo.login());
  }
}
