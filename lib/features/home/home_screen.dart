import 'package:flutter/material.dart';
import 'package:sfb/core/locale/app_locale_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String get route => '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(context.loc.welcome)));
  }
}
