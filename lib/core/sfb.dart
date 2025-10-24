import 'package:flutter/widget_previews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sfb/core/locale/app_localizations.dart';
import 'package:sfb/core/routing/app_router.dart';
import 'package:sfb/core/theme/app_theme.dart';

class Sfb extends StatefulWidget {
  @Preview(name: 'Sfb App')
  const Sfb({super.key});

  @override
  State<Sfb> createState() => _SfbState();
}

class _SfbState extends State<Sfb> {
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: _router.router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
    );
  }
}
