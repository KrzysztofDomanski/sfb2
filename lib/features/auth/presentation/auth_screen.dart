import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const route = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Auth Screen')));
  }
}
