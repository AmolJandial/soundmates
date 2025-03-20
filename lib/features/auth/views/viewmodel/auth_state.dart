import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String phoneNumber;
  final String countryCode;
  final bool showInfoDialog;
  final String otp;

  const AuthState({
    required this.phoneNumber,
    required this.countryCode,
    required this.showInfoDialog,
    required this.otp,
  });

  factory AuthState.initial() => const AuthState(phoneNumber: '', countryCode: '+91', showInfoDialog: false, otp: '');

  AuthState copyWith({String? phoneNumber, String? countryCode, bool? showInfoDialog, String? otp}) {
    return AuthState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
      showInfoDialog: showInfoDialog ?? this.showInfoDialog,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object> get props => [phoneNumber, countryCode, showInfoDialog, otp];
}
