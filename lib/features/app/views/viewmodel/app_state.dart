import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:soundmates/domain/app_user.dart';

enum UserStatus { unauthenticated, authenticated, undefined }

class AppState extends Equatable {
  final UserStatus userStatus;
  final String errorMessage;
  final AppUser? user;

  const AppState({required this.userStatus, required this.errorMessage, this.user});

  @override
  List<Object?> get props => [userStatus, errorMessage, user];

  AppState copyWith({UserStatus? userStatus, String? errorMessage, ValueGetter<AppUser?>? user}) {
    return AppState(
      userStatus: userStatus ?? this.userStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user != null ? user() : this.user,
    );
  }
}
