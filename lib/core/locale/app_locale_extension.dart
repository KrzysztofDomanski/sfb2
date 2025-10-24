import 'package:flutter/material.dart';
import 'package:sfb/core/locale/app_localizations.dart';

extension AppLocaleExtension on BuildContext {
  AppLocalizations get loc {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw Exception('AppLocalizations not found in context');
    }
    return localizations;
  }
}
