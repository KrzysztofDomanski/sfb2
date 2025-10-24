import 'package:flutter/widget_previews.dart';
import 'package:flutter/material.dart';
import 'package:sfb/core/theme/app_theme.dart';

class Sfb extends StatelessWidget {
  @Preview(name: 'Sfb App')
  const Sfb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const Scaffold(
        body: Center(child: Column(children: [Text('Hello World!')])),
      ),
    );
  }
}
