import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:soundmates/features/app/views/views.dart';
import 'package:soundmates/features/auth/views/views.dart';
import 'package:soundmates/utils/logger_config.dart';

class DashboardLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    appLogger.info('${state.uri.pathSegments}');
    return [
      if (state.uri.pathSegments.contains('dashboard'))
        const BeamPage(key: ValueKey('Dashboard'), title: 'Dashboard', child: Dashboard()),
      if (state.uri.pathSegments.contains('onboard'))
        const BeamPage(key: ValueKey('Onboarding'), title: 'Onboarding', child: OnboardingPage()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/dashboard', '/onboard'];
}
