import 'package:flutter/material.dart';
import 'package:sfb/core/dependency_injector.dart';
import 'package:sfb/core/locale/app_locale_extension.dart';
import 'package:sfb/core/widgets/navigation.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String get route => '/';

  @override
  Widget build(BuildContext context) {
    return Navigation(
      title: 'Home',
      selectedIndex: 0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.loc.welcome),
            ElevatedButton(
              onPressed: () async {
                await getIt<AuthRepository>().signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
