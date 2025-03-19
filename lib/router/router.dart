import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/features/app/views/viewmodel/app_state.dart';
import 'package:soundmates/features/app/views/viewmodel/app_viewmodel.dart';
import 'package:soundmates/router/auth_location.dart';
import 'package:soundmates/router/dashboard_locaiton.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/dashboard',
  guards: [
    BeamGuard(
      pathPatterns: ['/dashboard'],
      check: (context, location) {
        final container = ProviderScope.containerOf(context, listen: false);
        final appState = container.read(appViewmodelProvider).requireValue;

        return appState.userStatus == UserStatus.authenticated;
      },
      beamToNamed: (_, _) => '/onboard',
    ),
  ],
  locationBuilder: BeamerLocationBuilder(beamLocations: [DashboardLocation(), AuthLocation()]).call,
);
