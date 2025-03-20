import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/enums/dialog_status.dart';
import 'package:soundmates/features/app/views/viewmodel/info_dialog_viewmodel.dart';
import 'package:soundmates/features/auth/data/auth_repo.dart';
import 'package:soundmates/features/auth/views/viewmodel/auth_state.dart';
import 'package:soundmates/utils/logger_config.dart';

final authViewmodelProvider = AutoDisposeNotifierProvider<AuthViewmodel, AuthState>(AuthViewmodel.new);

class AuthViewmodel extends AutoDisposeNotifier<AuthState> {
  @override
  AuthState build() {
    _repo = ref.read(authRepoProvider);
    return AuthState.initial();
  }

  late final AuthRepo _repo;

  set phoneNumber(String newValue) => state = state.copyWith(phoneNumber: newValue);
  set countryCode(String newValue) => state = state.copyWith(countryCode: newValue);
  set otp(String newValue) => state = state.copyWith(otp: newValue);

  Future<void> verifyPhoneNumber() async {
    appLogger.info('${state.phoneNumber}, ${state.countryCode}}');
    final infoDialog = ref.read(infoDialogViewmodelProvider.notifier);
    infoDialog.copyWith(showDialog: true);
    infoDialog.copyWith(status: DialogStatus.loading, message: 'Veryfying number...');
    final result = await _repo.verifyPhone(state.phoneNumber, state.countryCode);
    result.fold(
      (failure) {
        infoDialog.copyWith(status: DialogStatus.error, message: failure.message);
        Future.delayed(2000.ms, () => infoDialog.copyWith(showDialog: false, message: ''));
      },
      (_) {
        infoDialog.copyWith(status: DialogStatus.success, message: 'OTP code has been sent to your provided number');
        Future.delayed(2000.ms, () => infoDialog.copyWith(showDialog: false, message: ''));
      },
    );
  }

  Future<void> verifyOtp() async {
    final infoDialog = ref.read(infoDialogViewmodelProvider.notifier);
    infoDialog.copyWith(showDialog: true);
    infoDialog.copyWith(status: DialogStatus.loading, message: 'Veryfying OTP...');
    final result = await _repo.verifyOtp(state.phoneNumber, state.countryCode, state.otp);
    result.fold(
      (failure) {
        infoDialog.copyWith(status: DialogStatus.error, message: failure.message);
        Future.delayed(2000.ms, () => infoDialog.copyWith(showDialog: false, message: ''));
      },
      (_) {
        infoDialog.copyWith(status: DialogStatus.success, message: 'OTP verified!');
        Future.delayed(2000.ms, () => infoDialog.copyWith(showDialog: false, message: ''));
      },
    );
  }
}
