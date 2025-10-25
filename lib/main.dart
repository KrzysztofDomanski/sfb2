import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sfb/core/database/database_client.dart';
import 'package:sfb/core/dependency_injector.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/core/sfb.dart';

Future<void> main() async {
  Log.t('Application started');

  await runZonedGuarded(
    () async {
      await initDatabase();
      configureDependencies();
      runApp(const Sfb());
    },
    (error, stackTrace) {
      Log.e('Uncaught error', error, stackTrace);
    },
  );
}
