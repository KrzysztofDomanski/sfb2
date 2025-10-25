import 'package:flutter/material.dart';

/// A widget that displays the application logo.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 128});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.sports_gymnastics, size: size);
  }
}
