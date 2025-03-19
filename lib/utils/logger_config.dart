import 'dart:developer';

import 'package:logging/logging.dart';

void configLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log(
      record.message,
      level: record.level.value,
      error: record.error,
      time: record.time,
      stackTrace: record.stackTrace,
      name: record.loggerName,
    );
  });
}

final appLogger = Logger('AppLogger');
