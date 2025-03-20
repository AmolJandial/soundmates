import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/features/app/views/views.dart';
import 'package:soundmates/firebase_options.dart';
import 'package:soundmates/utils/logger_config.dart';
import 'package:soundmates/utils/riverpod_observer.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    FlutterError.onError = (FlutterErrorDetails error) {
      catchUnhandledExceptions(error.exception, error.stack);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      catchUnhandledExceptions(error, stack);
      return true;
    };

    await dotenv.load(fileName: '.env');
    configLogger();
    EquatableConfig.stringify = true;
    Animate.restartOnHotReload = true;

    runApp(ProviderScope(observers: [RiverpodObserver()], child: const App()));
  }, catchUnhandledExceptions);
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
}

/*
  TODO: initial setup
 */
