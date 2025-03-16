import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:soundmates/features/auth/presentation/auth_page.dart';
import 'package:soundmates/features/auth/presentation/onboarding_page.dart';
import 'package:soundmates/features/auth/presentation/otp_page.dart';

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(key: ValueKey('onboarding'), child: OnboardingPage()),
      if (state.uri.pathSegments.contains('auth')) const BeamPage(key: ValueKey('auth'), child: AuthPage()),
      if (state.uri.pathSegments.contains('otp')) const BeamPage(key: ValueKey('otp'), child: OtpPage()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/auth/otp'];
}
