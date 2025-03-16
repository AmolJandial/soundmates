import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/router/auth_location.dart';

final routerProvider = Provider<BeamerDelegate>((ref) {
  return BeamerDelegate(
    locationBuilder: (routeInformation, _) {
      return AuthLocation();
    },
  );
});
