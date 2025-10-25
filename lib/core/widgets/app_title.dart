import 'package:flutter/material.dart';
import 'package:sfb/core/constants.dart';
import 'package:sfb/core/theme/theme_extensions.dart';

/// A widget that displays the application title.
class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppConstants.appName, style: context.textTheme.headlineLarge);
  }
}
