import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:soundmates/utils/logger_config.dart';

import '../features/auth/views/views.dart';

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    appLogger.info('${state.uri.pathSegments}');
    return [
      /// ensure that the pages are correctly replaced when the user navigates between them.
      if (state.uri.pathSegments.contains('auth')) const BeamPage(key: ValueKey('auth'), child: AuthPage()),
      if (state.uri.pathSegments.contains('otp')) const BeamPage(key: ValueKey('otp'), child: OtpPage()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/auth/otp'];
}
